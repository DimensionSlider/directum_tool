{$IFNDEF QSYNHIGHLIGHTERSAMPLE}
unit isbl_syntax_high;
{$ENDIF}

{$I SynEdit.inc}

interface

uses
{$IFDEF SYN_CLX}
  QGraphics,
  QSynEditTypes,
  QSynEditHighlighter,
  QSynUnicode,
{$ELSE}
  Graphics,
  SynEditTypes,
  SynEditHighlighter,
  SynUnicode,
{$ENDIF}
  SysUtils,
  Dialogs,
  Classes;

const
  reserved_hash_table_ammount = 10000;

type
  TtkTokenKind = (
    tkBlack,

    tkComment,
    tkIdentifier,

    tkKeyword,
    tkSysNameConstant,
    tkReservedName,
    tkFunction,

    tkNull,
    tkSpace,
    tkString,
    tkUnknown);

  TRangeState = (rsUnKnown, rsBraceComment, rsCStyleComment, rsDoubleSlashComment, rsDQString, rsQString);

  TProcTableProc      = procedure of object;
  PIdentFuncTableFunc = ^TIdentFuncTableFunc;
  TIdentFuncTableFunc = function (Index: Integer): TtkTokenKind of object;

type
  TSynISBLSyn = class(TSynCustomHighlighter)
  private
    lines : TList;

    fRange: TRangeState;
    only_numbers:boolean;
    fTokenID: TtkTokenKind;
    last_word : string;
    fIdentFuncTable: array[0..reserved_hash_table_ammount] of TIdentFuncTableFunc;
    fCommentAttri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    fBlackAttri : TSynHighlighterAttributes;
    fSpaceAttri: TSynHighlighterAttributes;
    fStringAttri: TSynHighlighterAttributes;
    fKeywordAttri        : TSynHighlighterAttributes;
    fSysNameConstantAttri: TSynHighlighterAttributes;
    fReservedNameAttri   : TSynHighlighterAttributes;
    fFunctionAttri       : TSynHighlighterAttributes;

    procedure IdentProc;
    procedure UnknownProc;
    function AltFunc(Index: Integer): TtkTokenKind;
    procedure InitIdent;
    function IdentKind(MayBe: PWideChar): TtkTokenKind;
    procedure NullProc;
    procedure SpaceProc;
    procedure CRProc;
    procedure LFProc;

//Слова-------------------------------------------------------------------------
    function FuncSysNameConstant(Index: Integer): TtkTokenKind;
    function FuncKeyWord(Index: Integer): TtkTokenKind;
    function FuncReservedName( Index:Integer ) : TtkTokenKind;

    //Диапазоны-----------------------------------------------------------------
    procedure BraceCommentOpenProc;
    procedure BraceCommentProc;

    procedure CStyleCommentOpenProc;
    procedure CStyleCommentProc;
    procedure DoubleSlashCommentProc;

    procedure DoubleQuoteStringOpenProc;
    procedure QuoteStringOpenProc;

    procedure DoubleQuoteStringProc;
    procedure QuoteStringProc;

  protected

    function IsFilterStored: Boolean; override;

  public

    parent : pointer;

    procedure AddKeyWord( keyword:PWideChar );
    procedure AddSysNameConstant( keyword:PWideChar );
    procedure AddReservedName( keyword:PWideChar );

    function HashKey(Str: PWideChar): Cardinal;
    function GetSampleSource: UnicodeString; override;
    constructor Create(AOwner: TComponent); override;
    class function GetFriendlyLanguageName: UnicodeString; override;
    class function GetLanguageName: string; override;
    function GetRange: Pointer; override;
    procedure ResetRange; override;
    procedure SetRange(Value: Pointer); override;
    function GetDefaultAttribute(Index: Integer): TSynHighlighterAttributes; override;
    function GetEol: Boolean; override;
    function GetKeyWords(TokenKind: Integer): UnicodeString; override;
    function GetTokenID: TtkTokenKind;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenKind: Integer; override;
    function IsIdentChar(AChar: WideChar): Boolean; override;
    function IsChar(AChar: WideChar): Boolean;
    function IsNumber(AChar: WideChar): Boolean;
    procedure Next; override;

  published
    property CommentAttri: TSynHighlighterAttributes read fCommentAttri write fCommentAttri;
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri write fIdentifierAttri;
    property KeyAttri: TSynHighlighterAttributes read fKeywordAttri write fKeywordAttri;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri write fSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read fStringAttri write fStringAttri;
    property SysNameConstantAttri: TSynHighlighterAttributes read fSysNameConstantAttri write fSysNameConstantAttri;

  end;

type
  PSyntax_token = ^syntax_token;
  syntax_token = record
    token    : PWideChar;
    is_set   : Boolean;
  end;

implementation

uses
SynEditStrConst;

 var
KeyWords  : TList;
KeyIndices: TList;

resourcestring
  SYNS_FilterTest       = 'All files (*.*)|*.*';

  SYNS_LangTest         = 'Test';
  SYNS_FriendlyLangTest = 'Test';
  SYNS_AttrTest         = 'Test';
  SYNS_FriendlyAttrTest = 'Test';

function TSynISBLSyn.GetKeyWords(TokenKind: Integer): UnicodeString;
begin
  Result :=
    'if,endif,while,endwhile,of,and,or,foreach,endforeach,not,else,in';
end;

procedure TSynISBLSyn.InitIdent;
var
  i: Integer;
begin
  for i := Low( fIdentFuncTable ) to High( fIdentFuncTable ) do
    if PSyntax_Token( KeyIndices.Items[ i ] ).is_set = false then
      fIdentFuncTable[ i ] := AltFunc;
end;

function TSynISBLSyn.HashKey(Str: PWideChar): Cardinal;
begin
  only_numbers := true;
  last_word := '';
  Result := 0;
  while IsIdentChar(Str^) do
  begin
    Result := Result * 1523  + Ord(Str^) * 1311;
    last_word := last_word + Str^;
    if isChar( Str^ ) then
      only_numbers := false;
    inc(Str);
  end;

  Result     := Result mod reserved_hash_table_ammount;
  fStringLen := Str - fToIdent;
end;
{$Q+}

//Выделение endif, if итд
function TSynISBLSyn.FuncKeyWord(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken( PSyntax_token( KeyIndices.Items[Index] ).token  ) then
    Result := tkKeyword
  else
    Result := tkIdentifier;
end;

//Выделение RESULT, references итд
function TSynISBLSyn.FuncReservedName(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken( PSyntax_token( KeyIndices.Items[Index] ).token  ) then
    Result := tkReservedName
  else
    Result := tkIdentifier;
end;

//Выделение слова SYSREF_....
function TSynISBLSyn.FuncSysNameConstant(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken( PSyntax_token( KeyIndices.Items[Index] ).token  ) then
    Result := tkSysNameConstant
  else
    Result := tkIdentifier;
end;

//Любая другая функция
function TSynISBLSyn.AltFunc(Index: Integer): TtkTokenKind;
begin
  Result := tkIdentifier;
end;

function TSynISBLSyn.IdentKind(MayBe: PWideChar): TtkTokenKind;
var
  Key        : Cardinal;
  last_index : integer;
  last_char  : Char;
begin
  fToIdent   := MayBe;
  Key        := HashKey(MayBe);
  last_index := length( last_word );
  last_char  := MayBe[ last_index ];

  if Key <= High(fIdentFuncTable) then
     Result := fIdentFuncTable[Key](Key)
  else
  begin
    Result := tkIdentifier;

  end;

  if ( last_char = '(' ) and ( fLine[Run-1] <> '.' ) then
    Result := tkFunction;

  if ( fLine[Run-1] = '.' ) then
    Result := tkBlack;

  if only_numbers then
    Result := tkBlack;
end;


//ОБРАБОТКА СИМВОЛОВ------------------------------------------------------------

procedure TSynISBLSyn.SpaceProc;
begin
  inc(Run);
  fTokenID := tkSpace;
  while (FLine[Run] <= #32) and not IsLineEnd(Run) do inc(Run);
end;

procedure TSynISBLSyn.NullProc;
begin
  fTokenID := tkNull;
  inc(Run);
end;

procedure TSynISBLSyn.CRProc;
begin
  fTokenID := tkSpace;
  inc(Run);
  if fLine[Run] = #10 then
    inc(Run);
end;

procedure TSynISBLSyn.LFProc;
begin
  fTokenID := tkSpace;
  inc(Run);
end;

//------------------------------------------------------------------------------

//КОММЕНТ-----------------------------------------------------------------------

procedure TSynISBLSyn.BraceCommentOpenProc;
begin
  Inc(Run);
  fRange := rsBraceComment;
  fTokenID := tkComment;
end;

procedure TSynISBLSyn.BraceCommentProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      fTokenID := tkComment;
      repeat
        if (fLine[Run] = '}') then
        begin
          Inc(Run, 1);
          fRange := rsUnKnown;
          Break;
        end;
        if not IsLineEnd(Run) then
          Inc(Run);
      until IsLineEnd(Run);
    end;
  end;
end;

procedure TSynISBLSyn.CStyleCommentOpenProc;
begin
  Inc(Run);
  if (fLine[Run] = '/') then
  begin
    Inc(Run, 1);
    fRange := rsDoubleSlashComment;
    fTokenID := tkComment;
  end
  else
  if (fLine[Run] = '*') then
  begin
    Inc(Run, 1);
    fRange := rsCStyleComment;
    fTokenID := tkComment;
  end
  else
    fTokenID := tkIdentifier;
end;

procedure TSynISBLSyn.DoubleSlashCommentProc;
begin

  case fLine[Run] of
    #0:
      begin
        fRange := rsUnKnown;
        NullProc;
      end;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      fTokenID := tkComment;
      repeat
        if IsLineEnd(Run) then
         fRange := rsUnKnown;

        if not IsLineEnd(Run) then
          Inc(Run);

      until IsLineEnd(Run);
    end;
  end;
end;


procedure TSynISBLSyn.CStyleCommentProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      fTokenID := tkComment;
      repeat
        if (fLine[Run] = '*') and (fLine[Run + 1] = '/') then
        begin
          Inc(Run, 2);
          fRange := rsUnKnown;
          Break;
        end;
        if not IsLineEnd(Run) then
          Inc(Run);
      until IsLineEnd(Run);
    end;
  end;
end;

//------------------------------------------------------------------------------

//СТРОКИ------------------------------------------------------------------------
procedure TSynISBLSyn.DoubleQuoteStringOpenProc;
begin
  Inc(Run);
  fRange := rsDQString;
  DoubleQuoteStringProc;
  fTokenID := tkString;
end;

procedure TSynISBLSyn.QuoteStringOpenProc;
begin
  Inc(Run);
  fRange := rsQString;
  QuoteStringProc;
  fTokenID := tkString;
end;

procedure TSynISBLSyn.DoubleQuoteStringProc;
begin
  fTokenID := tkString;
  repeat
    if (fLine[Run] = '"') then
    begin
      Inc(Run, 1);
      fRange := rsUnKnown;
      Break;
    end;
    if not IsLineEnd(Run) then
      Inc(Run);
  until IsLineEnd(Run);
end;

procedure TSynISBLSyn.QuoteStringProc;
begin
  fTokenID := tkString;
  repeat
    if (fLine[Run] = '''') then
    begin
      Inc(Run, 1);
      fRange := rsUnKnown;
      Break;
    end;
    if not IsLineEnd(Run) then
      Inc(Run);
  until IsLineEnd(Run);
end;

//------------------------------------------------------------------------------

//keyword нужно передавать в нижнем регистре
procedure TSynISBLSyn.AddKeyWord( keyword:PWideChar );
var
  hash:integer;
begin
  hash := HashKey( keyword );
  PSyntax_token( KeyIndices.Items[ hash ] ).token := keyword;
  PSyntax_token( KeyIndices.Items[ hash ] ).is_set := true;
  fIdentFuncTable[hash] := FuncKeyword;
end;

//keyword нужно передавать в нижнем регистре
procedure TSynISBLSyn.AddSysNameConstant( keyword:PWideChar );
var
  hash:integer;
begin
  hash := HashKey( keyword );
  PSyntax_token( KeyIndices.Items[ hash ] ).token  := keyword;
  PSyntax_token( KeyIndices.Items[ hash ] ).is_set := true;
  fIdentFuncTable[hash] := FuncSysNameConstant;
end;

procedure TSynISBLSyn.AddreservedName( keyword:PWideChar );
var
  hash:integer;
begin
  hash := HashKey( keyword );
  PSyntax_token( KeyIndices.Items[ hash ] ).token  := keyword;
  PSyntax_token( KeyIndices.Items[ hash ] ).is_set := true;
  fIdentFuncTable[hash] := FuncReservedName;
end;

procedure TSynISBLSyn.IdentProc;
begin
  fTokenID := IdentKind(fLine + Run);

  inc(Run, fStringLen);
  while IsIdentChar(fLine[Run]) do
    Inc(Run);
end;

procedure TSynISBLSyn.UnknownProc;
begin
  inc(Run);
  fTokenID := tkUnknown;
end;

procedure TSynISBLSyn.Next;
begin
  fTokenPos := Run;
  case fRange of
    rsBraceComment       : BraceCommentProc;
    rsCStyleComment      : CStyleCommentProc;
    rsDoubleSlashComment : DoubleSlashCommentProc;
  else
    case fLine[Run] of
      #0 : NullProc;
      #10: LFProc;
      #13: CRProc;

      '{': BraceCommentOpenProc;
      '/': CStyleCommentOpenProc;

      '"': DoubleQuoteStringOpenProc;
      '''': QuoteStringOpenProc;

      #1..#9, #11, #12, #14..#32: SpaceProc;
      'A'..'Z', 'a'..'z', '_', 'а'..'я', 'А'..'Я', '0'..'9': IdentProc;
    else
      UnknownProc;
    end;

  end;
  inherited;

end;

function TSynISBLSyn.GetDefaultAttribute(Index: Integer): TSynHighLighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT: Result    := fCommentAttri;
    SYN_ATTR_IDENTIFIER: Result := fIdentifierAttri;
    SYN_ATTR_KEYWORD: Result    := fKeywordAttri;
    SYN_ATTR_STRING: Result     := fStringAttri;
    SYN_ATTR_WHITESPACE: Result := fSpaceAttri;
  else
    Result := nil;
  end;
end;

function TSynISBLSyn.GetEol: Boolean;
begin
  Result := Run = fLineLen + 1;
end;

function TSynISBLSyn.GetTokenID: TtkTokenKind;
begin
  Result := fTokenId;
end;

function TSynISBLSyn.GetTokenAttribute: TSynHighLighterAttributes;
begin
  case GetTokenID of
    tkComment   : Result  := fCommentAttri;
    tkIdentifier: Result  := fIdentifierAttri;

    tkBlack     : Result := fBlackAttri;

    tkKeyword   : Result  := fKeywordAttri;
    tkReservedName : Result := fReservedNameAttri;
    tkSysNameConstant  : Result  := fSysNameConstantAttri;
    tkFunction : Result := fFunctionAttri;

    tkSpace     : Result  := fSpaceAttri;
    tkString    : Result  := fStringAttri;
    tkUnknown   : Result  := fIdentifierAttri;
  else
    Result := nil;
  end;
end;

function TSynISBLSyn.GetTokenKind: Integer;
begin
  Result := Ord(fTokenId);
end;

function TSynISBLSyn.IsIdentChar(AChar: WideChar): Boolean;
begin
  case AChar of
    '_', '0'..'9', 'a'..'z', 'A'..'Z', 'а'..'я', 'А'..'Я':
      Result := True;
    else
      Result := False;
  end;
end;

function TSynISBLSyn.IsChar(AChar: WideChar): Boolean;
begin
  case AChar of
    '_', 'a'..'z', 'A'..'Z', 'а'..'я', 'А'..'Я':
      Result := True;
    else
      Result := False;
  end;
end;

function TSynISBLSyn.IsNumber(AChar: WideChar): Boolean;
begin
  case AChar of
    ',', '.', '0'..'9':
      Result := True;
    else
      Result := False;
  end;
end;

function TSynISBLSyn.GetSampleSource: UnicodeString;
begin
  Result :=
    'No examples yet.';

end;

function TSynISBLSyn.IsFilterStored: Boolean;
begin
  Result := fDefaultFilter <> SYNS_FilterTest;
end;

class function TSynISBLSyn.GetFriendlyLanguageName: UnicodeString;
begin
  Result := SYNS_FriendlyLangTest;
end;

class function TSynISBLSyn.GetLanguageName: string;
begin
  Result := SYNS_LangTest;
end;

procedure TSynISBLSyn.ResetRange;
begin
  fRange := rsUnknown;
end;

procedure TSynISBLSyn.SetRange(Value: Pointer);
begin
  fRange := TRangeState(Value);
end;

function TSynISBLSyn.GetRange: Pointer;
begin
  Result := Pointer(fRange);
end;

constructor TSynISBLSyn.Create(AOwner: TComponent);
var
 empty_token : PSyntax_token;
 i:Integer;
begin
  inherited Create( AOwner );

  fCaseSensitive := False;
  KeyIndices     := TList.Create;

  for i := 0 to reserved_hash_table_ammount do
  begin
    New(empty_token);
    empty_token.is_set := false;
    empty_token.token  := '';
    KeyIndices.Add(empty_token);
  end;

  AddKeyWord('бля');

  //keyword нужно передавать в нижнем регистре
  AddKeyWord('if');           AddKeyWord('если');
  AddKeyWord('endif');        AddKeyWord('конецесли');
  AddKeyWord('else');         AddKeyWord('иначе');
  AddKeyWord('while');        AddKeyWord('пока');
  AddKeyWord('endwhile');     AddKeyWord('конецпока');
  AddKeyWord('foreach');      AddKeyWord('все');
  AddKeyWord('endforeach');   AddKeyWord('конецвсе');
  AddKeyWord('exitfor');      AddKeyWord('выходвсе');

  AddKeyWord('or');   AddKeyWord('или');
  AddKeyWord('and');  AddKeyWord('и');
  AddKeyWord('try');
  AddKeyWord('except');
  AddKeyWord('finally');
  AddKeyWord('endexcept');
  AddKeyWord('in');   AddKeyWord('в');
  AddKeyWord('not');  AddKeyWord('не');

  AddSysNameConstant('sysreq_func_group');
  AddSysNameConstant('sysref_functions');
  AddSysNameConstant('sysreq_code');

  AddSysNameConstant('true');
  AddSysNameConstant('false');
  AddSysNameConstant('cr');
  AddSysNameConstant('tab');

  AddSysNameConstant('nil');
  AddSysNameConstant('null');

  AddSysNameConstant('ecexception');
  AddSysNameConstant('ecwarning');

  AddSysNameConstant('ckedocument');

  AddSysNameConstant('cktask');
  AddSysNameConstant('ckany');
  AddSysNameConstant('ckfolder');
  AddSysNameConstant('ctedocument');
  AddSysNameConstant('ctcontrolJob');
  AddSysNameConstant('ctjob');
  AddSysNameConstant('ctnotice');
  AddSysNameConstant('ctfolder');
  AddSysNameConstant( 'yes_value' );
  AddSysNameConstant( 'no_value' );

  AddSysNameConstant(StrLower('wdttaskcollection'));
  AddSysNameConstant(StrLower('wdtusercollection'));

  AddSysNameConstant( 'sysreq_leader_reference' );

  AddSysNameConstant('mrok');
  AddSysNameConstant('vmselect');
  AddSysNameConstant('ishide');

  AddReservedName( 'result' );
  AddReservedName( 'результат' );
  AddReservedName( 'references' );
  AddReservedName( 'edocuments' );
  AddReservedName( 'object' );
  AddReservedName( 'application' );
  AddReservedName( 'servicefactory' );
  AddReservedName( 'searches' );



  //Настройка отображения строк-------------------------------------------------
  fCommentAttri := TSynHighLighterAttributes.Create(SYNS_AttrComment, SYNS_FriendlyAttrComment);
  fCommentAttri.Style := [fsItalic];
  fCommentAttri.Foreground := clNavy;
  AddAttribute(fCommentAttri);

  fStringAttri := TSynHighLighterAttributes.Create(SYNS_AttrString, SYNS_FriendlyAttrString);
  fStringAttri.Foreground := clNavy;
  AddAttribute(fStringAttri);

  fIdentifierAttri := TSynHighLighterAttributes.Create(SYNS_AttrIdentifier, SYNS_FriendlyAttrIdentifier);
  IdentifierAttri.Foreground := clPurple;
  AddAttribute(fIdentifierAttri);

  fSpaceAttri := TSynHighLighterAttributes.Create(SYNS_AttrSpace, SYNS_FriendlyAttrSpace);
  AddAttribute(fSpaceAttri);
  //Подсветка особых слов-------------------------------------------------------
  //ключевые слова if, endif итд.
  fKeywordAttri := TSynHighLighterAttributes.Create(SYNS_AttrReservedWord, SYNS_FriendlyAttrReservedWord);
  fKeywordAttri.Foreground := clBlack;
  fKeywordAttri.Style := [fsBold];
  fKeywordAttri.Background := clNone;
  AddAttribute(fKeywordAttri);

  fFunctionAttri := TSynHighLighterAttributes.Create('Function', 'Функция');
  fFunctionAttri.Foreground := clTeal;
  fFunctionAttri.Background := clNone;

  AddAttribute(fFunctionAttri);

  fReservedNameAttri := TSynHighLighterAttributes.Create('Зарезервированное имя объекта', 'Reserved object name');
  fReservedNameAttri.Foreground := clPurple;
  fReservedNameAttri.Style := [fsBold];
  fReservedNameAttri.Background := clNone;
  AddAttribute(fReservedNameAttri);

  fBlackAttri := TSynHighLighterAttributes.Create('Неизвестная функция', 'Неизвестная функция');
  fBlackAttri.Foreground := clBlack;
  AddAttribute(fBlackAttri);

  //константы
  fSysNameConstantAttri := TSynHighLighterAttributes.Create(SYNS_AttrTest, SYNS_FriendlyAttrVariable);
  fSysNameConstantAttri.Foreground := clNavy;
  fSysNameConstantAttri.Style := [fsBold];
  fSysNameConstantAttri.Background := clNone;
  AddAttribute(fSysNameConstantAttri);
  //----------------------------------------------------------------------------

  SetAttributesOnChange(DefHighlightChange);

  InitIdent;
  fDefaultFilter := SYNS_FilterTest;
  fRange := rsUnknown;
end;

initialization
{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynISBLSyn);
{$ENDIF}
end.



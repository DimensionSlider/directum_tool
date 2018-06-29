unit routine_strings;

interface

  uses SysUtils, Clipbrd, ShellApi, Dialogs, Classes, Windows;

  function StringAssigned( str:string ):boolean;
  function RussianToUnicode(S: String): String;
//procedure TextInRussian(AText: WideString);
  function SubString( raw_string, delimeter:string; index:integer ):string;
  function SubStringCount( raw_string, sub_string:string ):integer;
  function Replace(source_string:string;search_string,replace_string:string):string;
  function FindSubString( source_string, substring:string ):boolean;
  function IsIdentChar(AChar: WideChar): Boolean;
  procedure CollectWord(Str: PWideChar; var words: TStringList);

  function PosAfterPos( the_string, search_string:string; position:integer ):integer;
  function CopyFromTo( the_string:string; pos1, pos2:integer ):string;
  function ConvertString(strOld: string): string;
  function ExtractAfter( the_string:string; position:integer ):string;
  function YesNoToBool( the_string:string ):boolean;
  function MinusOneIfNull( the_string:string ):string;

  function CalcEncodedSize(InSize: DWord): DWord;
function CalcDecodedSize(const InBuffer; InSize: DWord): DWord;

procedure Base64Encode(const InBuffer; InSize: DWord; var OutBuffer);
procedure Base64Decode(const InBuffer; InSize: DWord; var OutBuffer);

function Base64EncodeString(const InText: AnsiString): AnsiString;
function Base64DecodeString(const InText: AnsiString): AnsiString;
function Base64EncodeToString(const InBuffer; InSize: DWord): AnsiString;

function ExtractString(sourceString, firstTag, secondTag: string): string;



implementation

const
  cBase64Codec: array[0..63] of AnsiChar =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  Base64Filler: AnsiChar = '=';

type
  TAByte = array[0..MaxInt - 1] of Byte;
  TPAByte = ^TAByte;

function ExtractString(sourceString, firstTag, secondTag: string): string;
var
   st,fin:Integer;
begin
  Result := '';
   repeat
     st := Pos( firstTag, sourceString );
     if st > 0 then
     begin
       sourceString    := Copy( sourceString,st+length(firstTag),length(sourceString)-1 );
       st     := 1;
       fin    := Pos( secondTag,sourceString );
       Result := result + Copy( sourceString,st,fin-st );
       sourceString    := Copy( sourceString, fin + length(secondTag),length(sourceString)-1);
     end;
   until st <= 0;
end;

{
procedure InputString( str:string  );
 var
   Inp: TInput;
   I: Integer;
 begin
   Edit1.SetFocus;

   for I := 1 to Length(Str) do
   begin
     // press 
    Inp.Itype := INPUT_KEYBOARD;
     Inp.ki.wVk := Ord(UpCase(Str[i]));
     Inp.ki.dwFlags := 0;
     SendInput(1, Inp, SizeOf(Inp));

     // release 
    Inp.Itype := INPUT_KEYBOARD;
     Inp.ki.wVk := Ord(UpCase(Str[i]));
     Inp.ki.dwFlags := KEYEVENTF_KEYUP;
     SendInput(1, Inp, SizeOf(Inp));

     Application.ProcessMessages;
   end;
end;
}

{
Procedure TextInRussian(AText: WideString);
var
  Clp: TClipboard;
  LKL: array [0..1023] of char;
begin
  GetKeyboardLayoutName( LKL );                   // çàïîìèíàåì êàêàÿ áûëà ðàñêëàäêà
  LoadKeyboardLayout( '00000419',KLF_ACTIVATE );  // ïåðåêëþ÷àåì íà ðóññêèé
  Clp := TClipboard.Create;
  Clp.AsText := AText;
  Clp.Free;
  LoadKeyboardLayout(LKL,KLF_ACTIVATE);         // âîçâðàùàåìñÿ ê çàïîìíåííîìó
end;
}



function IsIdentChar(AChar: WideChar): Boolean;
begin
  case AChar of
    '_', '0'..'9', 'a'..'z', 'A'..'Z', 'à'..'ÿ', 'À'..'ß':
      Result := True;
    else
      Result := False;
  end;
end;
     {
procedure CollectWord(Str: PWideChar; var words: TStringList);
var
  i:integer;
  word : string;
begin

  word := '';
  for i := 0 to length( str ) -1 do
    begin
      if IsIdentChar( str[i] ) then
        word := word + str[i]
      else
      begin
        if Length(word)>0 then
          words.Add( word );

        word := '';
      end;
    end;
end;
}

procedure CollectWord(Str: PWideChar; var words: TStringList);
var
  i:integer;
begin
  words.Add('');
  for i := 0 to length( str ) -1 do
    begin
      if IsIdentChar( str[i] ) then
        words[ words.Count-1 ] := words[ words.Count-1 ] + str[i]
      else
      begin
        if length( words[words.Count-1] ) > 0 then
          words.Add( '' );
      end;
    end;
end;

function MinusOneIfNull( the_string:string ):string;
begin
  if not StringAssigned( the_string ) then result := '-1'
  else
    result := the_string;
end;

function YesNoToBool( the_string:string ):boolean;
begin
  if ( the_string = 'Å' ) then
    result := true;

  if ( the_string = 'Ä' ) or ( the_string = 'Äà' ) then
    result := true;

  if ( the_string = 'Í' ) or ( the_string = 'Íåò' ) then
    result := false;

end;

function CopyFromTo( the_string:string; pos1, pos2:integer ):string;
begin
  result := Copy( the_string, pos1, pos2-pos1 );
end;

function ExtractAfter( the_string:string; position:integer ):string;
begin
  result := Copy( the_string, position, length( the_string ) - position );
end;

function PosAfterPos( the_string, search_string:string; position:integer ):integer;
var
  rest_string:string;
begin
  rest_string := Copy( the_string, position, length( the_string ) - position );
  result := position + Pos( search_string, rest_string );
end;

function Replace(source_string:string;search_string,replace_string:string):string;
var
  A:integer;
  S:string;
begin
  While Pos( search_string,LowerCase( source_string ))>0 Do
  begin
    A := Pos(search_string,Lowercase( source_string ));
    source_string:=Copy( source_string ,1,A-1) + replace_string + Copy(source_string,A+Length(search_string),Length(source_string) - (A+Length(search_string)) + 1);
  end;
  result := source_string;
end;


function FindSubString( source_string, substring:string ):boolean;
begin
  Result := Pos( AnsiLowerCase( substring ), AnsiLowerCase( ' ' + source_string ) ) > 0;
end;

function SubStringCount( raw_string, sub_string:string ):integer;
var
  position : integer;
  current_index:integer;
  middle_string:string;
  count:integer;
begin
  count := 0;
  current_index := 0;
  position := 1;

  while position <> 0 do
  begin
    middle_string := '';
    current_index := current_index + 1;
    position      := Pos( sub_string, raw_string );

    if position > 0 then
    begin
      middle_string := Copy( raw_string, 1, position - 1 );
      raw_string    := Copy( raw_string, position + 1, length( raw_string ) - position);
      count := count + 1;
    end;

  end;

  if count > 0 then
    count := count + 1;

  result := count;
end;


function SubString( raw_string, delimeter:string; index:integer ):string;
var
  position : integer;
  current_index:integer;
  middle_string:string;
begin
  current_index := 0;

  while current_index <> index do
  begin
    middle_string := '';
    current_index := current_index + 1;
    position      := Pos( delimeter, raw_string );

    if position > 0 then
    begin
      middle_string := Copy( raw_string, 1, position - 1 );
      raw_string    := Copy( raw_string, position + length(delimeter), length( raw_string ) - position );
    end;

    if position = 0 then
    begin
      if current_index = index then
        middle_string := raw_string
      else
      begin
        middle_string := '';
        break;
      end;
    end;

  end;

  result := middle_string;
end;

function RussianToUnicode(S: String): String;
var Wrd:Word;
  pW,pR:PWord;
  len:Integer;
begin
  pW:=@S[1];
  len:=Length(S);
  SetLength(Result,len);
  pR:=@Result[1];
  while Len<>0 do begin
    Wrd:=pW^;
    case Wrd of
      $C0..$DF,$E0..$FF:pR^:=Wrd+$0350;
      else pR^:=Wrd;
    end;
    inc(pW);
    inc(pR);
    dec(Len);
  end;
end;

  function StringAssigned( str:string ):boolean;
  begin
    if length( str ) > 0 then result := true
    else result := false;
  end;

function ConvertString(strOld: string): string;
 const
   strUni : string = '#1072#1073#1074#1075#1076#1077#1108#1078#1079#1080#1110#1111#1081#1082#1083'+
     '#1084#1085#1086#1087#1088#1089#1090#1091#1092#1093#1094#1095#1096#1097#1102#1103#1100'+
     '#1040#1041#1042#1043#1044#1045#1028#1046#1047#1048#1030#1031#1049#1050#1051#1052#1053#1054#1055#1056#1057#1058#1059#1060#1061#1062#1063#1064#1065#1070#1071#1068#8470#1099#1067#1105#1025#1101#1069#1098#1066';
     

   strWin : string = 'àáâãäå¦æçè¬©éêëìíîïðñòóôõö÷øùþÿüÀÁÂÃÄÅLÆÇÈ¦¦ÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÞßÜ¦ûÛ¸¨ýÝúÚ';
 var
   letCount, i: integer;
   strNew: string;            
 begin
   if pos('#',strOld) = 0 then
     Result := strOld
   else
   begin
     strNew := strOld;
     letCount := length(strWin);
     for i:=1 to letCount do
       strNew := stringReplace(strNew, copy(strUni, (i-1)*5+1, 5), ''''+copy(strWin, i, 1)+'''', [rfReplaceAll]);
     strNew := stringReplace(strNew, '''''', '', [rfReplaceAll]);
     Result := strNew;
   end;
 end;

function CalcEncodedSize(InSize: DWord): DWord;
begin
  // no buffers passed along, calculate outbuffer size needed
  Result := (InSize div 3) shl 2;
  if (InSize mod 3) > 0 then
    Inc(Result, 4);
end;

function CalcDecodedSize(const InBuffer; InSize: DWord): DWord;
begin
  Result := 0;
  if InSize = 0 then
    Exit;
  if (InSize mod 4 <> 0) then
    Exit;

  Result := InSize div 4 * 3;
  if (PByte(DWord(InBuffer) + InSize - 2)^ = Ord(Base64Filler)) then
    Dec(Result, 2)
  else
  if (PByte(DWord(InBuffer) + InSize - 1)^ = Ord(Base64Filler)) then
    Dec(Result);
end;

procedure Base64Encode(const InBuffer; InSize: DWord; var OutBuffer);
var
  X: Integer;
  PIn, POut: TPAByte;
  Acc: Cardinal;
begin
  if InSize > 0 then
  begin
    PIn := @InBuffer;
    POut := @OutBuffer;

    for X := 1 to InSize div 3 do
    begin
      Acc := PIn^[0] shl 16 + PIn^[1] shl 8 + PIn^[2];

      POut^[0] := Byte(cBase64Codec[(Acc shr 18) and $3f]);
      POut^[1] := Byte(cBase64Codec[(Acc shr 12) and $3f]);
      POut^[2] := Byte(cBase64Codec[(Acc shr 6 ) and $3f]);
      POut^[3] := Byte(cBase64Codec[(Acc       ) and $3f]);

      Inc(Cardinal(POut), 4);
      Inc(Cardinal(PIn),  3);
    end;
    case InSize mod 3 of
      1 :
      begin
        Acc := PIn^[0] shl 16;

        POut^[0] := Byte(cBase64Codec[(Acc shr 18) and $3f]);
        POut^[1] := Byte(cBase64Codec[(Acc shr 12) and $3f]);
        POut^[2] := Byte(Base64Filler);
        POut^[3] := Byte(Base64Filler);
      end;
      2 :
      begin
        Acc := PIn^[0] shl 16 + PIn^[1] shl 8;

        POut^[0] := Byte(cBase64Codec[(Acc shr 18) and $3f]);
        POut^[1] := Byte(cBase64Codec[(Acc shr 12) and $3f]);
        POut^[2] := Byte(cBase64Codec[(Acc shr 6 ) and $3f]);
        POut^[3] := Byte(Base64Filler);
      end;
    end;
  end;
end;

procedure Base64Decode(const InBuffer; InSize: DWord; var OutBuffer);
const
  cBase64Codec: array[0..255] of Byte =
  (
    $FF, $FF, $FF, $FF, $FF, {005>} $FF, $FF, $FF, $FF, $FF, // 000..009
    $FF, $FF, $FF, $FF, $FF, {015>} $FF, $FF, $FF, $FF, $FF, // 010..019
    $FF, $FF, $FF, $FF, $FF, {025>} $FF, $FF, $FF, $FF, $FF, // 020..029
    $FF, $FF, $FF, $FF, $FF, {035>} $FF, $FF, $FF, $FF, $FF, // 030..039
    $FF, $FF, $FF, $3E, $FF, {045>} $FF, $FF, $3F, $34, $35, // 040..049
    $36, $37, $38, $39, $3A, {055>} $3B, $3C, $3D, $FF, $FF, // 050..059
    $FF, $00, $FF, $FF, $FF, {065>} $00, $01, $02, $03, $04, // 060..069
    $05, $06, $07, $08, $09, {075>} $0A, $0B, $0C, $0D, $0E, // 070..079
    $0F, $10, $11, $12, $13, {085>} $14, $15, $16, $17, $18, // 080..089
    $19, $FF, $FF, $FF, $FF, {095>} $FF, $FF, $1A, $1B, $1C, // 090..099
    $1D, $1E, $1F, $20, $21, {105>} $22, $23, $24, $25, $26, // 100..109
    $27, $28, $29, $2A, $2B, {115>} $2C, $2D, $2E, $2F, $30, // 110..119
    $31, $32, $33, $FF, $FF, {125>} $FF, $FF, $FF, $FF, $FF, // 120..129
    $FF, $FF, $FF, $FF, $FF, {135>} $FF, $FF, $FF, $FF, $FF, // 130..139
    $FF, $FF, $FF, $FF, $FF, {145>} $FF, $FF, $FF, $FF, $FF, // 140..149
    $FF, $FF, $FF, $FF, $FF, {155>} $FF, $FF, $FF, $FF, $FF, // 150..159
    $FF, $FF, $FF, $FF, $FF, {165>} $FF, $FF, $FF, $FF, $FF, // 160..169
    $FF, $FF, $FF, $FF, $FF, {175>} $FF, $FF, $FF, $FF, $FF, // 170..179
    $FF, $FF, $FF, $FF, $FF, {185>} $FF, $FF, $FF, $FF, $FF, // 180..189
    $FF, $FF, $FF, $FF, $FF, {195>} $FF, $FF, $FF, $FF, $FF, // 190..199
    $FF, $FF, $FF, $FF, $FF, {205>} $FF, $FF, $FF, $FF, $FF, // 200..209
    $FF, $FF, $FF, $FF, $FF, {215>} $FF, $FF, $FF, $FF, $FF, // 210..219
    $FF, $FF, $FF, $FF, $FF, {225>} $FF, $FF, $FF, $FF, $FF, // 220..229
    $FF, $FF, $FF, $FF, $FF, {235>} $FF, $FF, $FF, $FF, $FF, // 230..239
    $FF, $FF, $FF, $FF, $FF, {245>} $FF, $FF, $FF, $FF, $FF, // 240..249
    $FF, $FF, $FF, $FF, $FF, {255>} $FF                      // 250..255
  );
var
  X, Y: Integer;
  PIn, POut: TPAByte;
  Acc : dword;
begin
  if (InSize > 0) and (InSize mod 4 = 0) then
  begin
    InSize := InSize shr 2;
    PIn := @InBuffer;
    POut := @OutBuffer;

    for X := 1 to InSize - 1 do
    begin
      Acc := 0;
      Y := -1;

      repeat
        Inc(Y);
        Acc := Acc shl 6;
        Acc := Acc or cBase64Codec[PIn^[Y]];
      until Y = 3;

      POut^[0] := Acc shr 16;
      POut^[1] := Byte(Acc shr 8);
      POut^[2] := Byte(Acc);

      Inc(Cardinal(PIn),  4);
      Inc(Cardinal(POut), 3);
    end;
    Acc := 0;
    Y := -1;

    repeat
      Inc(Y);
      Acc := Acc shl 6;

      if PIn^[Y] = Byte(Base64Filler) then
      begin
        if Y = 3 then
        begin
          POut^[0] := Acc shr 16;
          POut^[1] := Byte(Acc shr 8);
        end
        else
          POut^[0] := Acc shr 10;
        Exit;
      end;

      Acc := Acc or cBase64Codec[PIn^[Y]];
    until Y = 3;

    POut^[0] := Acc shr 16;
    POut^[1] := Byte(Acc shr 8);
    POut^[2] := Byte(Acc);
  end;
end;

procedure Base64EncodeStr(const InText: AnsiString; var OutText: AnsiString);
var
  InSize, OutSize: DWord;
  PIn, POut: Pointer;
begin
  // get size of source
  InSize := Length(InText);
  // calculate size for destination
  OutSize := CalcEncodedSize(InSize);

  // prepare AnsiString length to fit result data
  SetLength(OutText, OutSize);

  if OutSize > 0 then
  begin
    PIn := @InText[1];
    POut := @OutText[1];

    // encode !
    Base64Encode(PIn^, InSize, POut^);
  end;
end;

procedure Base64DecodeStr(const InText: AnsiString; var OutText: AnsiString);
var
  InSize, OutSize: DWord;
  PIn, POut: Pointer;
begin
  // get size of source
  InSize := Length(InText);
  // calculate size for destination
  PIn := @InText[1];
  OutSize := CalcDecodedSize(PIn, InSize);

  // prepare AnsiString length to fit result data
  SetLength(OutText, OutSize);

  if OutSize > 0 then
  begin
    FillChar(OutText[1], OutSize, '.');
    POut := @OutText[1];

    // encode !
    Base64Decode(PIn^, InSize, POut^);
  end;
end;

function Base64EncodeString(const InText: AnsiString): AnsiString;
begin
  Base64EncodeStr(InText, Result);
end;

function Base64DecodeString(const InText: AnsiString): AnsiString;
begin
  Base64DecodeStr(InText, Result);
end;

function Base64EncodeToString(const InBuffer; InSize: DWord): AnsiString;
var
  POut: Pointer;
begin
  SetLength(Result, CalcEncodedSize(InSize));
  POut := @Result[1];
  Base64Encode(InBuffer, InSize, POut^);
end;


end.

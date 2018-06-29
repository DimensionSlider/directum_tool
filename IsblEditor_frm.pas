{
  нужна функци€ вставки значений констант в код
  нужна функци€ сниппетов
  можно добавить в редакторе поддержку подсказки по COM объектам
  можно добавить поиск в текстах разработки функций, которые не установлены в системе
  подсветка внутри строковых запросов, кодов PHP и других за счет комментариев до и после //CODE:PHP //CODE:SQL итд
  сворачивать по комментари€ми в типа‘ункции
  добавить возможно редактировать большие строки в отдельном окне с подсветочкой
  сереньким подсвечивать в окончании end конструкции услови€ из начала
  исполнение только выделенного кода

}

unit IsblEditor_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SynEdit, ComCtrls, JvExComCtrls, JvStatusBar, ToolWin, JvToolBar,
  Menus, SynCompletionProposal, SynEditKeyCmds, routine_synedit,XMLDoc, generics.collections,
  StdCtrls, ExtCtrls, simplelexer, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxClasses, dxRibbon, AdvToolBar, AdvToolBarStylers,
  JvDockControlForm, JvComponentBase, JvDockTree, JvDockVIDStyle,
  JvDockVSNetStyle;

type
  TisblEditorForm = class(TForm)
    JvToolBar1           : TJvToolBar;
    ToolButton1          : TToolButton;
    JvStatusBar1         : TJvStatusBar;
    MainMenu             : TMainMenu;
    N1                   : TMenuItem;
    N3                   : TMenuItem;
    N4                   : TMenuItem;
    N5                   : TMenuItem;
    N6                   : TMenuItem;
    N7                   : TMenuItem;
    N8                   : TMenuItem;
    SynCompletionProposal: TSynCompletionProposal;
    isbl_dev_edit        : TSynEdit;
    J1: TMenuItem;
    Panel1: TPanel;
    Button1: TButton;
    lexerMini: TButton;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    JvDockVSNetStyle: TJvDockVSNetStyle;
    JvDockServer: TJvDockServer;
    procedure Button1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure EndOfTokenChr1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure isbl_dev_editProcessCommand(Sender: TObject; var Command:
        TSynEditorCommand; var AChar: Char; Data: Pointer);
    procedure lexerMiniClick(Sender: TObject);
    procedure SynCompletionProposalAfterCodeCompletion(Sender: TObject; const
        Value: string; Shift: TShiftState; Index: Integer; EndToken: Char);
    procedure SynCompletionProposalExecute(Kind: SynCompletionType; Sender:
        TObject; var CurrentInput: string; var x, y: Integer; var CanExecute:
        Boolean);
  private
    procedure CompletionHighLevel;
    procedure CompletionReferenceFactory;
    procedure CompletionReferencesFactory;
    procedure UpperLevelProposals;
    { Private declarations }
  public
    procedure OnRun;
    { Public declarations }
  end;

  type
   TLexer = class
  private
    FData: string;
    FTokenStart: PChar;
    FCurrPos: PChar;
    function GetCurrentToken: string;
  public
    constructor Create(const AData: string);
    function GetNextToken: Boolean;
    property CurrentToken: string read GetCurrentToken;
  end;


  type
    platformParam = record
      name         : string;
      platformType : string;
  end;

  type
    platformPropertie = record
      name         : string;
      platformType : string;
  end;

  type
    platformMethod = record
      name      : string;
      params    : TList<platformParam>;
      kind      : string;
      resultType: string;
  end;

  type
    platformType = record
      name       : string;
      methods    : TList<platformParam>;
      properties : TList<platformPropertie>;
  end;

procedure VSNetDockForm(AForm: TForm; APanel: TJvDockVSNETPanel);


var
  isblEditorForm: TisblEditorForm;
  xmlDocument   : TXMLDocument;
  dotCompletion : Boolean;
  Definitions   : TList<platformType>;

implementation

{$R *.dfm}

uses isbl_syntax_high, SynEditHighlighter, routine_strings, Unit1,
  assistant_options_frm;



{
  по галочке в настройках давать подсказку по константам ADO DB или других €зыков
}


{ TLexer }

constructor TLexer.Create(const AData: string);
begin
  FData := AData;
  FCurrPos := PChar(FData);
end;

function TLexer.GetCurrentToken: string;
begin
  SetString(Result, FTokenStart, FCurrPos - FTokenStart);
end;

function TLexer.GetNextToken: Boolean;
var
  cp: PChar;
begin
  cp := FCurrPos; // copy to local to permit register allocation

  // skip whitespace; this test could be converted to an unsigned int
  // subtraction and compare for only a single branch
  while (cp^ > #0) and (cp^ <= #32) do
    Inc(cp);

  // using null terminater for end of file
  Result := cp^ <> #0;

  if Result then
  begin
    FTokenStart := cp;
    Inc(cp);
    while cp^ > #32 do
      Inc(cp);
  end;

  FCurrPos := cp;
end;

procedure TisblEditorForm.Button1Click(Sender: TObject);
var
  defFile          : string;
  defString        : string;
  firstToken       : string;
  i                : Integer;
  newParamType     : platformType;
  process_file_name: string;
  stringList       : TStringList;
  work_dir         : string;
  Lexer            : TSimpleLexer;
begin

//
//  Definitions.Clear;
//  process_file_name := ExtractFileName( paramstr(0) );
//  work_dir          := ExtractFileDir( paramstr(0) );
//  defFile           := work_dir + '\' + 'typedef' + '.def';
//  if FileExists( defFile ) then
//  begin
//     stringList := TStringList.Create();
//     stringLIst.LoadFromFile( defFile );
//     for i := 0 to stringList.Count-1 do
//     begin
//        defString  := stringList.Strings[i];
//        Lexer := TSimpleLexer.Create();
//        Lexer.Feed(defString);
//
//        Lexer.Free();
//     end;
//
//
//  end;

end;

procedure TisblEditorForm.CompletionHighLevel;
begin
  addNewImportantVariableProposal(SynCompletionProposal,'References');
  addNewImportantVariableProposal(SynCompletionProposal,'EDocuments');
  addNewImportantVariableProposal(SynCompletionProposal,'ServiceFactory');
  addNewImportantVariableProposal(SynCompletionProposal,'Application');
  addNewImportantVariableProposal(SynCompletionProposal,'ComponentTokens');
  addNewImportantVariableProposal(SynCompletionProposal,'Reports');
  addNewImportantVariableProposal(SynCompletionProposal,'Scripts');
  addNewImportantVariableProposal(SynCompletionProposal,'Searches');
  addNewImportantVariableProposal(SynCompletionProposal,'Sender');
  addNewImportantVariableProposal(SynCompletionProposal,'Object');
  addNewImportantVariableProposal(SynCompletionProposal,'SystemDialogs');
  addNewImportantVariableProposal(SynCompletionProposal,'Tasks');
  addNewImportantVariableProposal(SynCompletionProposal,'Wizards');
  addNewImportantVariableProposal(SynCompletionProposal,'Sender');
  addNewImportantVariableProposal(SynCompletionProposal,'Result');
end;

procedure TisblEditorForm.CompletionReferenceFactory;
begin
  addNewVariableProposal( SynCompletionProposal, 'Name', 'string' );
  addNewVariableProposal( SynCompletionProposal, 'History','IComponent' );
  addNewVariableProposal( SynCompletionProposal, 'ID', 'Integer' );
  addNewVariableProposal( SynCompletionProposal, 'Title', 'WideString' );
  addNewVariableProposal( SynCompletionProposal, 'LinkedReferenceNames', 'IStringList' );
  addNewVariableProposal( SynCompletionProposal, 'Application', 'IApplication' );
  addNewVariableProposal( SynCompletionProposal, 'Kind', 'TContentKind' );
  addNewVariableProposal( SynCompletionProposal, 'ObjectInfo', 'IObjectInfo' );
  addNewFunctionProposal( SynCompletionProposal, 'CreateNew', '','IObject' );
  addNewFunctionProposal( SynCompletionProposal, 'GetComponent', '','IReference' );
  addNewFunctionProposal( SynCompletionProposal, 'GetObjectByCode', 'const code: WideString','IObject' );
  addNewProcedureProposal( SynCompletionProposal, 'DeleteByCode', 'const Code: WideString' );
  addNewProcedureProposal( SynCompletionProposal, 'DeleteByID',   'ID: Integer' );
end;

procedure TisblEditorForm.CompletionReferencesFactory;
begin
  addNewFunctionProposal( SynCompletionProposal, 'ReferenceFactory', 'const name: WideString','IReferenceFactory' );
  {
   добавить имена всех справочников
  }
end;

procedure TisblEditorForm.E1Click(Sender: TObject);
var
  defFile          : string;
  defString        : string;
  firstToken       : string;
  i                : Integer;
  newParamType     : platformType;
  process_file_name: string;
  stringList       : TStringList;
  work_dir         : string;
begin
  Definitions.Clear;
  process_file_name := ExtractFileName( paramstr(0) );
  work_dir          := ExtractFileDir( paramstr(0) );
  defFile           := work_dir + '\' + 'typedef' + '.def';
  if FileExists( defFile ) then
  begin
     stringList := TStringList.Create();
     stringLIst.LoadFromFile( defFile );
     for i := 0 to stringList.Count-1 do
     begin
        defString  := stringList.Strings[i];
        firstToken := defString[1];
        if firstToken <> #9 then
        begin
//          newParamType.name :=

        end;


     end;


  end;

end;

procedure TisblEditorForm.OnRun;
var
  DockClient1: TJvDockClient;
begin
//  DIRAssistant.ManualDock( jvDockServer.RightDockPanel );
//  dock_assistant_options.ManualDock( jvDockServer.RightDockPanel );

// ManualConjoinDock(JvDockServer.RightDockPanel,  DIRAssistant, dock_assistant_options );
//  DockClient1 := FindDockClient(DIRAssistant);
//  DockClient1.
end;

procedure TisblEditorForm.EndOfTokenChr1Click(Sender: TObject);
begin
  SynCompletionProposal.EndOfTokenChr := '.';
end;

procedure TisblEditorForm.FormCreate(Sender: TObject);
var
  isblHightlighter : TSynISBLSyn;
begin
  Definitions               := TList<platformType>.Create();
  isblHightlighter          := TSynISBLSyn.Create(Self);
  isbl_dev_edit.Highlighter := isblHightlighter;
  UpperLevelProposals();
//  jvDockServer.RightDockPanel.Width  := 300;
end;

procedure VSNetDockForm(AForm: TForm; APanel: TJvDockVSNETPanel);
begin
  //  AForm.Width := 180;
  AForm.Top := 10000;
  //  AForm.Visible := true;
  AForm.ManualDock(APanel,nil,APanel.Align);
  APanel.ShowDockPanel(True, AForm);
end;

procedure TisblEditorForm.isbl_dev_editProcessCommand(Sender: TObject; var
    Command: TSynEditorCommand; var AChar: Char; Data: Pointer);
var
   apoint,temppoint : TPoint;
   coords           : TBufferCoord;
   displayCoord     : TDisplayCoord;
   schema_tablename : string;
begin

//  if ( achar <> #13 )
//   and ( achar <> #0 )
//   and ( achar <> #9 )
//   and ( achar <> '' )
//   and ( achar <> '.') then
//      SynCompletionProposal.ActivateCompletion();
//   

   if achar = '.' then
    dotCompletion := true;
//    begin
//      SynCompletionProposal.Options := SynCompletionProposal.Options - [scoLimitToMatchedText];
//      SynCompletionProposal.ActivateCompletion();
//      SynCompletionProposal.Options := SynCompletionProposal.Options + [scoLimitToMatchedText];
//
////       coords              := isbl_dev_edit.CaretXY;
////       coords.Char         := coords.Char - 1;
////       schema_tablename    := isbl_dev_edit.GetWordAtRowCol( coords );
////       temppoint.y         := isbl_dev_edit.CaretY;
////       temppoint.x         := isbl_dev_edit.CaretX;
////       temppoint.y         := temppoint.y + 1;
////       displayCoord.Column := temppoint.X;
////       displayCoord.Row    := temppoint.Y;
////       apoint              := isbl_dev_edit.ClientToScreen( isbl_dev_edit.RowColumnToPixels( displayCoord ) );
////       SynCompletionProposal.Execute( '',apoint.X, apoint.Y );
//
//    end;



end;

function ReverseString(S : String): String;
Var
   i : Integer;
Begin
   Result := '';
   For i := Length(S) DownTo 1 Do
   Begin
     Result := Result + Copy(S,i,1) ;
   End;
End;

procedure TisblEditorForm.lexerMiniClick(Sender: TObject);
var
  lastChar   : string;
  lexingLine : string;
  longToken  : string;
  pos        : Integer;
begin
  pos        := isbl_dev_edit.CaretX;
  lexingLine := isbl_dev_edit.Lines[isbl_dev_edit.CaretY-1];
  longToken  := '';
  lastChar   := '';

  if pos < 2 then
    Exit();

  if StringAssigned(lexingLine) then
  while ( lastChar <> #32 ) and ( pos > 0 ) do
  begin
    longToken := longToken + lexingLine[pos];
    if lexingLine[pos] = ')' then
    begin
      pos := pos - 1;
      while ( lexingLine <> '(' ) and ( pos > 1 ) do
      begin
        longToken := longToken + lexingLine[pos];
        pos := pos - 1;
      end;
    end
    else
     pos := pos - 1;
     lastChar := lexingLine[pos];
   end;

  longToken := ReverseString( longToken );
  ShowMessage( longToken );

end;

procedure TisblEditorForm.UpperLevelProposals;
var
  prettyString: string;
begin
  SynCompletionProposal.ItemList.Clear;
  SynCompletionProposal.InsertList.Clear;
  CompletionHighLevel;
end;

procedure TisblEditorForm.SynCompletionProposalAfterCodeCompletion(Sender:
    TObject; const Value: string; Shift: TShiftState; Index: Integer; EndToken:
    Char);
var
  i: Integer;
  l: Integer;
begin
{
  with isbl_dev_edit do
  begin
    l := Length(Value);
    i := Pos('|', Value);
    if i <> 0 then
    begin
      SelStart := Pred(SelStart - (l - i));
      SelEnd := Succ(SelStart);
      SelText := '';
    end;
  end;
  }
end;

procedure TisblEditorForm.SynCompletionProposalExecute(Kind: SynCompletionType;
    Sender: TObject; var CurrentInput: string; var x, y: Integer; var
    CanExecute: Boolean);
var
  attri       : TSynHighlighterAttributes;
  coords      : TBufferCoord;
  gotAttri    : Boolean;
  handledToken: Boolean;
  token       : string;
  tokenType   : string;
begin
  //
  handledToken := false;
  SynCompletionProposal.ItemList.Clear;
  SynCompletionProposal.InsertList.Clear;

  // после какого слова включили точку------------------------------------------
  coords       := isbl_dev_edit.CaretXY;
  coords.Char  := coords.Char-2;
  token        := isbl_dev_edit.GetWordAtRowCol( coords );
  gotAttri     := isbl_dev_edit.GetHighlighterAttriAtRowCol( coords, token, attri );
  //----------------------------------------------------------------------------

  // определение типа токена----------------------------------------------------
  if (gotAttri) and (attri.Name = 'Punctuation') then
  begin
    if token = ')' then
    begin

    end;

  end;
  if (gotAttri) and (attri.Name = 'Identifier') then
  begin


  end;
  if (gotAttri) and (attri.Name = 'ReservedObjectName') then
  if token = 'References' then
   begin
     tokenType := 'IReferencesFactory';
     SynCompletionProposal.ItemList.Clear;
     SynCompletionProposal.InsertList.Clear;
   end;
  //----------------------------------------------------------------------------

  // определение через точку----------------------------------------------------
  if (dotCompletion) and (gotAttri)then
  begin
    if tokenType = 'IReferencesFactory' then
    begin
      CompletionReferencesFactory();
      handledToken := true;
    end;
    if tokenType = 'IReferenceFactory' then
    begin
      CompletionReferenceFactory();
      handledToken := true;
    end;
  end;
  //----------------------------------------------------------------------------

  // верхний уровень, обща€ подсказка-------------------------------------------
  if ( not handledToken ) and not dotCompletion then
   UpperLevelProposals();
  //----------------------------------------------------------------------------

  dotCompletion := false;

end;

end.


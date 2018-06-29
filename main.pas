unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, sToolBar, Menus, SynEditHighlighter,
  SynHighlighterXML, SynEdit, MSXML2_TLB, routine_debug, JvComponentBase,
  JvTrayIcon, inifiles;

type
  Twindow = class(TForm)
    BigImagesList: TImageList;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    TrayIcon: TJvTrayIcon;
    TrayPopupMenu: TPopupMenu;
    N4: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure toolbar_assistantClick(Sender: TObject);
    procedure toolbar_optionsClick(Sender: TObject);
    procedure toolbar_exitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnRun();
    procedure FormCreate(Sender: TObject);
    procedure toolbar_connectionClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure InitXMLConfig();
    procedure N3Click(Sender: TObject);
    procedure OnChildClose();
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
      { Public declarations }
  protected
      procedure CreateParams(var Params: TCreateParams);override;
  end;

var
  window: Twindow;
  only_debugger : boolean;

  //XML ������------------------------------------------------------------------
  coXMLDoc          : ComsDOMDocument;
  xml_configuration : IXMLDOMDocument;
  nodelist          : IXMLDOMNodeList;
  node              : IXMLDomNode;
  xml_log_settings_path : string;
  //----------------------------------------------------------------------------

  //���������-------------------------------------------------------------------
  configuration         : TIniFile;
  work_dir              : String;
  process_file_name     : string;
  current_computer_name : string;
  //----------------------------------------------------------------------------

  directumLoginPoint    : Variant;
  directumApplication   : Variant;


implementation

uses  Unit1, options_frm, connection_options;

{$R *.dfm}
//$R dbxmss.Res
//$R sqlncli10.Res

Function ExtractDll(ResType, ResName, SaveToFile: string): Boolean;
var
  T: Cardinal;
  TR: TResourceStream;
  Dir: array[0..255] of AnsiChar;
begin
  Result:= False;
  TR:= TResourceStream.Create(HInstance,ResName,PChar(ResType));
  TR.SaveToFile( ExtractFilePath(ParamStr(0)) +'\'+ SaveToFile );
  Result:= True;
end;

procedure TWindow.CreateParams(var Params: TCreateParams);
 begin
  inherited;
  // ��������� � ����������� ����� ���� WS_EX_AppWindow,
  // ����� ����� � ���������� ����� ������ �� ������ �����.
  // Params.ExStyle:=Params.ExStyle or WS_EX_TOOLWINDOW;
 end;

procedure TWindow.OnChildClose;
begin
{  if not only_debugger then
  if not DIRAssistant.Visible then
    Show();
    }
  //if only_debugger then
  Close;
end;

//XML
procedure Twindow.InitXMLConfig();
begin
  xml_configuration     := ComsDOMDocument.Create;
  process_file_name     := ExtractFileName( paramstr( 0 ) );
  work_dir              := ExtractFileDir( paramstr( 0 ) );
  xml_log_settings_path := work_dir + '\' + process_file_name + '.xmlcfg';

  if FileExists( xml_log_settings_path ) then
  begin
    options_form.config_editor.Lines.LoadFromFile( xml_log_settings_path );
    xml_configuration.loadXML( options_form.config_editor.Text );
  end
  else
  begin
    options_form.config_editor.Lines.SaveToFile( xml_log_settings_path );
    xml_configuration.load( options_form.config_editor.Text )
  end;

  {
  options_form.Show;
  options_form.pagecontrol.ActivePage := options_form.config_page;
  }

end;

procedure Twindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  isbl_debugger.OnShutdown();
  configuration.WriteInteger( 'position','main_x', window.Left );
  configuration.WriteInteger( 'position','main_y', window.Top );
end;

procedure Twindow.toolbar_assistantClick(Sender: TObject);
begin
//  DIRAssistant.Show;
//  DIRAssistant.BringToFront;
//  DIRAssistant.WindowState := wsNormal;
//  window.Hide;
end;

procedure Twindow.toolbar_optionsClick(Sender: TObject);
begin
//  options_form.Show;
//  options_form.BringToFront;
end;

procedure Twindow.toolbar_exitClick(Sender: TObject);
begin
//  Close;
end;

procedure Twindow.toolbar_connectionClick(Sender: TObject);
begin
//  connection_options_form.Show();
//  connection_options_form.BringToFront;
end;

procedure Twindow.FormCreate(Sender: TObject);
begin
  //  SetWindowLong(Application.Handle,GWL_ExStyle,GetWindowLong(Application.Handle,GWL_ExStyle) or WS_EX_ToolWindow);
  //  only_debugger := true;
  //  Application.MainFormOnTaskbar := False;
  //  ExtractDll( 'Dll', 'dbxmss', 'dbxmss.dll');
  //  ExtractDll( 'Dll', 'sqlncli10', 'sqlncli10.dll');
    Application.ShowMainForm := false;
  //  Hide();
end;

procedure Twindow.FormHide(Sender: TObject);
begin
  ShowWindow(Application.Handle, sw_Hide);
end;

procedure Twindow.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, sw_Show);
end;

procedure Twindow.N2Click(Sender: TObject);
begin
//    window.Width                 := 410;
//// xml_configuration_editor.Visible := true;
//    toolbar_assistant.Visible    := true;
//    toolbar_options.Visible      := true;
//    toolbar_connection.Visible   := true;
//    only_debugger                := false;
//    trayicon.Active              := true;
end;

procedure Twindow.N3Click(Sender: TObject);
begin
  ShowDebugNotModal();
end;

procedure Twindow.N4Click(Sender: TObject);
begin
  DIRAssistant.Show;
  DIRAssistant.BringToFront;
  DIRAssistant.WindowState := wsNormal;
  window.Hide;
end;

procedure Twindow.N6Click(Sender: TObject);
begin
  options_form.Show;
  options_form.BringToFront;
end;

procedure Twindow.N7Click(Sender: TObject);
begin
  connection_options_form.Show();
  connection_options_form.BringToFront;
end;

procedure Twindow.N8Click(Sender: TObject);
begin
  Close;
end;

procedure Twindow.OnRun;
var
  last_host             : string;
  last_time_connection  : string;
begin
  //��������� ���������---------------------------------------------------------
  process_file_name := ExtractFileName( paramstr(0) );
  work_dir          := ExtractFileDir( paramstr(0) );
  configuration     := TINIFile.Create( work_dir + '\' + process_file_name + '.ini' );
  //----------------------------------------------------------------------------

  //������� ��������� ����������� � �� � �����������----------------------------
  last_host            := configuration.ReadString('host', 'station', '' );
  last_time_connection := configuration.ReadString('auth', 'last_time_connect_attempt', '' );
  //----------------------------------------------------------------------------

  InitXMLConfig();
  window.Left := configuration.ReadInteger( 'position','main_x', window.Left );
  window.Top  := configuration.ReadInteger( 'position','main_y', window.Top );
  Hide;
  DIRAssistant.Show();

end;

end.

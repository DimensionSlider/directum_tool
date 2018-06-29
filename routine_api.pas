unit routine_api;

interface

  uses ShellAPI, Windows, Messages, Forms, Controls, Classes, RichEdit, Menus, CommCtrl, uProcessMemMgr, SysUtils, Dialogs,

  routine_strings ;

    procedure PostThroughLayout( paste_string:string );
    procedure PostString( str:string );
    procedure OpenUrl(url:string);
    function GetOtherWindowMemoText(const sCaption : String) : WideString;
    function ReadComputerName:string;
    function GetWindText(window_handle: THandle): String;
    function SetWindText(window_handle: THandle): String;
    function GetKbdLayoutInWnd( target_window:THandle ) : LongWord;
    function GetSelText(handle_editor_memo: THandle): String;
    function GetWindowClassName( window_handle:THandle ):string;
    function GetStatusBarText(hStatusBarHandle: HWND; PanelNumber: Integer): string;
    function GetKeyboardLayoutNameInWindow( window:hwnd ):PAnsiChar;

    procedure ConnectToEditor( possible_window:HWND );
    function ConnectToTaskForm( possible_window:HWND ):boolean;

    procedure ShortCutToHotKey(HotKey: TShortCut; var Key : Word; var Modifiers: Uint);
    function GetOwnerWindowTitle( child_handle:THandle ):string;

const
  CNT_LAYOUT = 2; // количество известных раскладок
  ENGLISH    = $409;
  RUSSIAN    = $419;

  TKbdValue : array [ 1..CNT_LAYOUT ] of LongWord =
                ( ENGLISH,
                  RUSSIAN
                );
  TKbdDisplayNames : array [ 1..CNT_LAYOUT ] of string =
                ('English',
                 'Русский'
                );

type hex = string[8];

implementation


uses Unit1, routine_debug, assistant_options_frm;



function dec2hex(value: dword): string;
const
  hexdigit = '0123456789ABCDEF';
begin
  Result := '';
  while value > 0 do
  begin
    Result := hexdigit[succ(value and $F)] + Result;
    value := value shr 4;
  end;
  if Result = '' then Result := '0';
end;            

procedure ShortCutToHotKey(HotKey: TShortCut; var Key : Word; var Modifiers: Uint);
var
  Shift: TShiftState;
begin
  ShortCutToKey(HotKey, Key, Shift);
  Modifiers := 0;
  if (ssShift in Shift) then
  Modifiers := Modifiers or MOD_SHIFT;
  if (ssAlt in Shift) then
  Modifiers := Modifiers or MOD_ALT;
  if (ssCtrl in Shift) then
  Modifiers := Modifiers or MOD_CONTROL;
end;  

//по сути просто дублирование проверки, сохранение хендла в общедоступной переменной и установка служебных флагов   
procedure ConnectToEditor( possible_window:HWND );
var
  editor_component : HWND;
begin
  if possible_window = 0 then exit;
    
  editor_component := possible_window;
  editor_component := FindWindowEx(editor_component, 0, 'TSLSynEdit', nil);
    
  if editor_component <> 0 then
  begin
    handle_editor_window  := possible_window;
    handle_editor_memo    := editor_component;
    if handle_editor_memo <> 0 then
    begin     
      is_connected_to_editor := true;
    end
    else
    begin
      is_connected_to_editor := false;
    end;
  end;
  
end;

function GetWindowClassName( window_handle:THandle ):string;
var
    class_name: array [0..255] of char;
begin
  if isWindow( window_handle ) then
    GetClassName(
       window_handle,
       class_name,
       Pred(SizeOf(class_name))
    )
  else
  class_name := '';

  result := String( class_name );
end;

function GetOwnerWindowTitle( child_handle:THandle ):string;
var
  parent_handle : THandle;
  parent_window_title:array[0..255] of Char;
  title:string;
begin
  title := '';

  parent_handle := GetWindow( child_handle, GW_OWNER );
  if parent_handle <> 0 then
  begin
    GetWindowText(parent_handle, parent_window_title, SizeOf(parent_window_title));
    title := string( parent_window_title );
  end;
  
  result := title;

end;

//по сути просто дублирование проверки, сохранение хендла в общедоступной переменной и установка служебных флагов
function ConnectToTaskForm( possible_window:HWND ):boolean;
var
  statusbar : HWND;
  window_class:string;
begin
  if possible_window = 0 then exit;
  window_class := GetWindowClassName( possible_window );

  if ( window_class = 'TSBTaskForm' ) or ( window_class = 'TSBJobForm' ) then
  begin
    statusbar    := possible_window; 
    statusbar    := FindWindowEx(statusbar, 0, 'TStatusBar', nil);
    if statusbar <> 0 then
    begin
      handle_task_window        := possible_window;
      handle_taskform_statusbar := statusbar;
      if handle_taskform_statusbar <> 0 then
      begin     
        is_connected_to_task_form := true;
        result := true;
      end
      else
      begin
        is_connected_to_task_form := false;
        result := false;
      end;
    end;     
  end
  else
    result := false;

end;

//    memo1.Text := GetWindText(editor_window_handle);

function SetWindText(window_handle: THandle): String;
var
    cb : DWord;
begin
  {
    cb := memo1.Lines.Count;
    SetLength(Result, cb);
    if cb > 0 then
        SendMessage(editor_synedit_handle, WM_SETTEXT, cb+1, LParam(memo1.Text));

}        
end;

function GetWindText(window_handle: THandle): String;
var
    cb : DWord;
begin
    cb := SendMessage(window_handle, WM_GETTEXTLENGTH, 0, 0);
    SetLength(Result, cb);
    if cb > 0 then
        SendMessage(window_handle, WM_GETTEXT , cb+1, LParam(@Result[1]));

end;

Function GetOtherWindowMemoText(const sCaption : String) : WideString;
var
         hWindow : THandle;
         hChild  : THandle;

         aTemp      : array[0..5000] of Char;
         sClassName : String;
begin
         Result := '';

         hWindow := FindWindow(Nil,PChar(sCaption));

         if hWindow = 0 then begin
            ShowMessage('НЕ МОГУ найти программу');
            exit;
         end;

         hChild := GetWindow(hWindow, GW_CHILD);
         while hChild <> 0 do Begin
               if GetClassName(hChild, aTemp, SizeOf(aTemp)) > 0 then begin
                  sClassName := StrPAS(aTemp);

                  if sClassName = 'Edit' then begin
                     SendMessage(hChild,WM_GETTEXT,SizeOf(aTemp),Integer(@aTemp));

                     Result := StrPAS(aTemp);
                  end;
               end;
               hChild := GetWindow(hChild, GW_HWNDNEXT);
         end;
end;

Function GetOtherWindowText(const sCaption : String) : WideString;
var
         hWindow : THandle;
         hChild  : THandle;

         aTemp      : array[0..5000] of Char;
         sClassName : String;
begin
         Result := '';
         hWindow := FindWindow(Nil,PChar(sCaption));
         if hWindow = 0 then begin
            ShowMessage('НЕ МОГУ найти программу');
            exit;
         end;

         hChild := GetWindow(hWindow, GW_CHILD);

         while hChild <> 0 do Begin
               if GetClassName(hChild, aTemp, SizeOf(aTemp)) > 0 then begin
                  sClassName := StrPAS(aTemp);

                  if sClassName = 'Edit' then begin
                     SendMessage(hChild,WM_GETTEXT,SizeOf(aTemp),Integer(@aTemp));

                     Result := StrPAS(aTemp);
                  end;
               end;
               hChild := GetWindow(hChild, GW_HWNDNEXT);
         end;
end;


function GetStatusBarText(hStatusBarHandle: HWND; PanelNumber: Integer): string;
var
  PMM: TProcessMemMgr;
  NumberOfPanels, Len: Integer;
  PrcBuf: PChar;
  PartText: string;
begin
  if hStatusBarHandle = 0 then Exit;
  PMM := CreateProcessMemMgrForWnd(hStatusBarHandle);
  try
    NumberOfPanels := SendMessage(hStatusBarHandle, SB_GETPARTS, 0, 0);
    if PanelNumber < NumberOfPanels then
    begin
      Len := LOWORD(SendMessage(hStatusBarHandle, SB_GETTEXTLENGTH, PanelNumber, 0));
      if Len > 0 then
      begin
        PrcBuf := PMM.AllocMem(Len + 1);
        SendMessage(hStatusBarHandle, SB_GETTEXT, PanelNumber, Longint(PrcBuf));
        Result := PMM.ReadStr(PrcBuf);
        PMM.FreeMem(PrcBuf);
      end
      else
      begin
        Result := '';
      end;
    end;
  finally
    PMM.Free;
  end;
end;

function GetSelText(handle_editor_memo: THandle): String;
var
    cb : DWord;
begin                                    
 //   cb := SendMessage(editor_synedit_handle, WM_GETTEXTLENGTH, 0, 0);
//    SetLength(Result, cb);
//    if cb > 0 then
//        SendMessage(editor_synedit_handle, WM_, cb+1, LParam(@Result[1]));
end;

function NameKeyboardLayout(layout : LongWord) : string;
var
  i: integer;
begin
  Result:='';
  try
    for i:=1 to CNT_LAYOUT do
      if TKbdValue[i]=layout then Result:= TKbdDisplayNames[i];
  except
    Result:='';
  end;
end;

function GetKeyboardLayoutNameInWindow( window:hwnd ):PAnsiChar;
var
  layout : LongWord;
begin
  new( result );
  layout := GetKbdLayoutInWnd( window );
  result := PAnsiChar( '00000' + dec2hex( layout ) );
end;

//Отправить сообщение в окно переключая раскладку клавиатуры под ту что в приложении.
//если раскладки при копировании будут неодинаковы, тогда текст исковеркается при передаче
// работает 100%
procedure PostThroughLayout( paste_string:string );
var
  layout_in_editor_window   : LongWord;
  assLayout                 : LongWord;
  target_layout_str         : PAnsiChar;
  own_layout_str            : PAnsiChar;
  backup_layout_name        : array [0..1023] of char;
  idThread                  : Integer;
  the_parent                : hwnd;
  unicode_string            : widestring;
  Layout                    : HKL;
  KK                        : HKL;
  KBid                      : Integer;
  Dumme                     : DWORD;
  switchBack                : boolean;
  switchHomeToRussian       : Boolean;
Const
  USKeyboard = 1033;
  RusKeyboard = 1049;
begin
  switchBack          := false;
  switchHomeToRussian := false;
  if paste_string <> '' then
  begin
    //Оформление вставки----------------------------------------------------------
    if dock_assistant_options.quotes_mode_rbtn.Checked then
      paste_string := '''' + paste_string + '''';
    if dock_assistant_options.double_quotes_mode_rbtn.Checked then
      paste_string := '"' + paste_string + '"';
    //----------------------------------------------------------------------------

    idThread := GetWindowThreadProcessId(DIRAssistant.Handle);
    KK       := GetKeyboardLayout(idThread);
    KBid     := LOWORD(KK);
    if KBid = RusKeyboard then
      switchHomeToRussian := true;

    idThread := GetWindowThreadProcessId(handle_editor_window);
    KK       := GetKeyboardLayout(idThread);
    KBid     := LOWORD(KK);
    If KBid = USKeyboard Then
    begin
       Layout     := LoadKeyboardLayout('00000419', KLF_ACTIVATE);
       SendMessageTimeOut(handle_editor_window, WM_INPUTLANGCHANGEREQUEST, 0, Layout, SMTO_ABORTIFHUNG, 200, Dumme);
       switchBack := true;
    end;

    PostString( paste_string );

    if switchBack then
    begin
       Layout     := LoadKeyboardLayout('00000409', KLF_ACTIVATE);
       SendMessageTimeOut( handle_editor_window, WM_INPUTLANGCHANGEREQUEST, 0, Layout, SMTO_ABORTIFHUNG, 200, Dumme);

       if switchHomeToRussian then
       begin
         Layout     := LoadKeyboardLayout('00000419', KLF_ACTIVATE);
         SendMessageTimeOut( DIRAssistant.Handle, WM_INPUTLANGCHANGEREQUEST, 0, Layout, SMTO_ABORTIFHUNG, 200, Dumme);
       end;
    end;
  end;

end;


procedure OpenUrl(url:string);
begin
  ShellExecute(0, 'open', PChar(url), nil, nil, SW_SHOW);
end;

//Отправка текста в окно посимвольно
procedure PostString( str:string );
var
  i:integer;
  unicode_string : widestring;
begin
  str            := #0 + str;
  unicode_string := str;

  //для неюникод окна
  if not IsWindowUnicode( handle_editor_memo ) then
  for i:= 1 to Length( str ) do
  begin
    Sleep(1);
    PostMessage( handle_editor_memo, wm_Char, Word(str[ i ]), 0);
  end;

  //в юникод окно текст отправляется уже по другому
  if IsWindowUnicode( handle_editor_memo ) then
  for i:= 1 to Length( unicode_string ) do
  begin
    PostMessageW( handle_editor_memo, wm_Char, Word(unicode_string[ i ]), 0);
  end;

  SetForegroundWindow( handle_editor_memo );
end;

//получить раскладку клавиатуры для окна по хендлу
function GetKbdLayoutInWnd( target_window:THandle ) : LongWord;
var
  idProcess : THandle;
begin
  // Получить идентификатор чужого процесса
  idProcess := GetWindowThreadProcessId( target_window,nil );  
  // Получить текущую раскладку в чужой программе
  Result:=( GetKeyboardLayout( idProcess ) shr $10 );
end;

//получить имя компьютера
function ReadComputerName:string;
var
	i:DWORD;  
	p:PChar;       	
begin
	i:=255; 
	GetMem(p, i); 
	GetComputerName(p, i); 
	Result:=String(p); 
	FreeMem(p);  	
end;

//не используется
 procedure PostKeyExHWND(hWindow: HWnd; key: Word; const shift: TShiftState;
   specialkey: Boolean);
 {************************************************************ 
 * Procedure PostKeyEx 
 *
 * Parameters: 
 *  hWindow: target window to be send the keystroke 
 *  key    : virtual keycode of the key to send. For printable
 *           keys this is simply the ANSI code (Ord(character)). 
 *  shift  : state of the modifier keys. This is a set, so you 
 *           can set several of these keys (shift, control, alt, 
 *           mouse buttons) in tandem. The TShiftState type is 
 *           declared in the Classes Unit. 
 *  specialkey: normally this should be False. Set it to True to 
 *           specify a key on the numeric keypad, for example. 
 *           If this parameter is true, bit 24 of the lparam for
 *           the posted WM_KEY* messages will be set.
 * Description:
 *  This procedure sets up Windows key state array to correctly
 *  reflect the requested pattern of modifier keys and then posts
 *  a WM_KEYDOWN/WM_KEYUP message pair to the target window. Then
 *  Application.ProcessMessages is called to process the messages
 *  before the keyboard state is restored.
 * Error Conditions:
 *  May fail due to lack of memory for the two key state buffers.
 *  Will raise an exception in this case.
 * NOTE:
 *  Setting the keyboard state will not work across applications
 *  running in different memory spaces on Win32 unless AttachThreadInput
 *  is used to connect to the target thread first.
 *Created: 02/21/96 16:39:00 by P. Below
 ************************************************************}

 type
   TBuffers = array [0..1] of TKeyboardState;
 var
   pKeyBuffers: ^TBuffers;
   lParam: LongInt;
 begin
   (* check if the target window exists *)
   if IsWindow(hWindow) then
   begin
     (* set local variables to default values *)
     pKeyBuffers := nil;
     lParam := MakeLong(0, MapVirtualKey(key, 0));

     (* modify lparam if special key requested *)
     if specialkey then
       lParam := lParam or $1000000;

     (* allocate space for the key state buffers *)
     New(pKeyBuffers);
     try
       (* Fill buffer 1 with current state so we can later restore it.
          Null out buffer 0 to get a "no key pressed" state. *)
       GetKeyboardState(pKeyBuffers^[1]);
       FillChar(pKeyBuffers^[0], SizeOf(TKeyboardState), 0);

       (* set the requested modifier keys to "down" state in the buffer*)
       if ssShift in shift then
         pKeyBuffers^[0][VK_SHIFT] := $80;
       if ssAlt in shift then
       begin
         (* Alt needs special treatment since a bit in lparam needs also be set *)
         pKeyBuffers^[0][VK_MENU] := $80;
         lParam := lParam or $20000000;
       end;
       if ssCtrl in shift then
         pKeyBuffers^[0][VK_CONTROL] := $80;
       if ssLeft in shift then
         pKeyBuffers^[0][VK_LBUTTON] := $80;
       if ssRight in shift then
         pKeyBuffers^[0][VK_RBUTTON] := $80;
       if ssMiddle in shift then
         pKeyBuffers^[0][VK_MBUTTON] := $80;

       (* make out new key state array the active key state map *)
       SetKeyboardState(pKeyBuffers^[0]);
       (* post the key messages *)
       if ssAlt in Shift then
       begin
         PostMessage(hWindow, WM_SYSKEYDOWN, key, lParam);
         PostMessage(hWindow, WM_SYSKEYUP, key, lParam or $C0000000);
       end
       else
       begin
         PostMessage(hWindow, WM_KEYDOWN, key, lParam);
         PostMessage(hWindow, WM_KEYUP, key, lParam or $C0000000);
       end;
       (* process the messages *)
       Application.ProcessMessages;

       (* restore the old key state map *)
       SetKeyboardState(pKeyBuffers^[1]);
     finally
       (* free the memory for the key state buffers *)
       if pKeyBuffers <> nil then
         Dispose(pKeyBuffers);
     end; { If }
   end;
 end; { PostKeyEx }

end.

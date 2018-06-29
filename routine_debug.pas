unit routine_debug;

interface
  uses Forms;

  procedure DebugMessage( str:string );
  procedure ShowDebug();
  procedure ShowDebugNotModal();
  procedure EditText( str:string );
  procedure EditText_SetXMLHightlighter();
  procedure EditText_SetSQLHightlighter();
  procedure EditText_SetDFMHightlighter();

implementation

uses debug_form,text_unit, unit1, main;

procedure DebugMessage( str:string );
begin
  debug_window.output.Lines.Add( str );
  debug_window.output.Lines.SaveToFile( work_dir + '\debug.txt' );
  Application.ProcessMessages;
//  ShowDebug();
end;

procedure ShowDebug();
begin
  if not debug_window.Visible then
    debug_window.ShowModal;
end;

procedure ShowDebugNotModal();
begin
 debug_window.Show;
end;

procedure EditText( str:string );
begin
  text_form.SynEdit1.Text := str;
  text_form.ShowModal;
end;

procedure EditText_SetSQLHightlighter();
begin
  text_form.SynEdit1.Highlighter := text_form.SynSQLSyn;
end;

procedure EditText_SetXMLHightlighter();
begin
  text_form.SynEdit1.Highlighter := text_form.SynXMLSyn;
end;

procedure EditText_SetDFMHightlighter();
begin
  text_form.SynEdit1.Highlighter := text_form.SynDfmSyn;
end;



end.

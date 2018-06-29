program directum_assistant_tool;





uses
  ExceptionLog,
  Forms,
  Windows,
  SysUtils,
  IniFiles,
  Unit1 in 'Unit1.pas' {DIRAssistant},
  connection_options in 'connection_options.pas' {connection_options_form},
  routine_strings in 'routine_strings.pas',
  routine_api in 'routine_api.pas',
  sql_comfort_form in 'sql_comfort_form.pas' {query_form},
  routine_directum_specific in 'routine_directum_specific.pas',
  debug_form in 'debug_form.pas' {debug_window},
  IPCThrd in 'IPCThrd.pas',
  uProcessMemMgr in 'uProcessMemMgr.pas',
  test_frm in 'test_frm.pas' {test_form},
  directum_view in 'directum_view.pas',
  directum_metadata in 'directum_metadata.pas',
  options_frm in 'options_frm.pas' {options_form},
  requisites_list in 'requisites_list.pas',
  reference_list in 'reference_list.pas',
  routine_db in 'routine_db.pas',
  workroom in 'workroom.pas' {workroom_form},
  section_list in 'section_list.pas',
  routine_debug in 'routine_debug.pas',
  progress_bar_unit in 'progress_bar_unit.pas' {progress_bar_form},
  compare_unit in 'compare_unit.pas' {compare_form},
  msi_unit in 'msi_unit.pas' {msi_form},
  text_unit in 'text_unit.pas' {text_form},
  virtual_tree_routine in 'virtual_tree_routine.pas',
  dock_ignore_list in 'dock_ignore_list.pas' {dock_isbl_ignorelist},
  main in 'main.pas' {window},
  assistant_options_frm in 'assistant_options_frm.pas' {dock_assistant_options},
  log_message_frm in 'log_message_frm.pas' {log_message_form},
  debug_worker_thread in 'debug_worker_thread.pas',
  frm_nonvisual in 'frm_nonvisual.pas' {nonvisual},
  IsblEditor_frm in 'IsblEditor_frm.pas' {isblEditorForm},
  routine_synedit in '..\directum_common\routine_synedit.pas',
  isbl_syntax_high in '..\directum_common\isbl_syntax_high.pas',
  simplelexer in 'simplelexer.pas';

{R *.TLB}

{$R *.res}

procedure OnShutdown();
begin
//  isbl_debugger.OnShutdown;
end;

procedure OnRun();
begin
  connection_options_form.OnRun;
  DIRAssistant.OnRun;
  isblEditorForm.OnRun();

//  isbl_debugger.OnRun;
//  dock_variables_list.OnRun();
//  dock_isbl_tree.OnRun();
  window.OnRun;

  process_file_name := ExtractFileName( paramstr(0) );
  work_dir          := ExtractFileDir( paramstr(0) );
  configuration     := TINIFile.Create( work_dir + '\' + process_file_name + '.ini' );

end;

begin
  Application.Initialize;
  Application.Title := 'Инструмент';
  Application.CreateForm(Twindow, window);
  Application.CreateForm(TDIRAssistant, DIRAssistant);
  Application.CreateForm(Tdock_isbl_ignorelist, dock_isbl_ignorelist);
  Application.CreateForm(Tconnection_options_form, connection_options_form);
  Application.CreateForm(Tquery_form, query_form);
  Application.CreateForm(Tdebug_window, debug_window);
  Application.CreateForm(Ttest_form, test_form);
  Application.CreateForm(Toptions_form, options_form);
  Application.CreateForm(Tworkroom_form, workroom_form);
  Application.CreateForm(Tprogress_bar_form, progress_bar_form);
  Application.CreateForm(Tcompare_form, compare_form);
  Application.CreateForm(Tmsi_form, msi_form);
  Application.CreateForm(Ttext_form, text_form);
  Application.CreateForm(Tdock_assistant_options, dock_assistant_options);
  Application.CreateForm(Tlog_message_form, log_message_form);
  Application.CreateForm(Tnonvisual, nonvisual);
  Application.CreateForm(TisblEditorForm, isblEditorForm);
  //  Уже после создания всех форм
  OnRun();
// Рантайм
  Application.Run;
  OnShutdown();
  //После смерти приложения
  //...
end.

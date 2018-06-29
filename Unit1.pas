{
  Сервис: для признака в дереве или во всплывающем меню нужно как-то отображать возможные варианты значений этого признака
  Сервис: контекстное меню для каждого элемента дерева для разовой вставки в определенном режиме без переключения режима в настройках
  Редактор: вставка ид табличной части в редактор
  Сервис: высвечивать номер detaildataset в TreeView для таблиц
  Сервис: Для каждого хендла хранить состояние вкладок. Если нет сохраненного, тогда выставлять по умолчанию
  Сервис: можно как-то метить или подсвечивать реквизиты в дереве если они выложены на форме и отображаются
  Сервис: не хватает заголовков для таблиц. непонятно какая таблица чем заполняется в справочнике
}

unit Unit1;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  DB,
  ADODB,
  Grids,
  DBGrids, DBClient, ComCtrls, Menus, ExtCtrls,
  Clipbrd, IniFiles, FMTBcd, SqlExpr, ActnList, ToolWin, ActnMan, ActnCtrls,
  XPStyleActnCtrls, ShellAPI, ImgList, RichEdit, xmldom, XMLIntf, msxmldom, XMLDoc, //свои,
  routine_strings, routine_api, routine_directum_specific, directum_metadata, requisites_list, reference_list, section_list, VirtualTrees, sSkinManager, sEdit,
  sListBox, sComboBox, sTreeView, sPageControl, sToolBar, sRadioButton, sGroupBox, 
  sLabel, sPanel, sStatusBar, directum_view, DBCtrls, DBXMSSQL, ExtDlgs, ComObj, ComServ, Registry, XPMan,
  JvDockTree, JvDockControlForm, JvDockVIDStyle, JvDockVSNetStyle,
  JvComponentBase, JvExComCtrls, JvToolBar, JvImageList, JvMenus, DBAccess, Uni,
  JvBDEQuery, MemDS, UniProvider, SQLServerUniProvider;

type
  TDIRAssistant = class(TForm)

    StatusBar      : TsStatusBar;
    connector_guard: TTimer;
    ToolBar        : TsToolBar;
    filter_panel   : TsPanel;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    DIRECTUM1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    XMLDocument: TXMLDocument;
    PageControl: TsPageControl;
    object_sheet: TsTabSheet;
    task_sheet: TsTabSheet;
    task_properties: TStringGrid;
    params_filter_panel: TsPanel;
    params_filter_ed: TsEdit;
    info_panel: TsPanel;
    ToolBar1: TsToolBar;
    toolbtn_params_namevalue_mode: TToolButton;
    toolbtn_properties_4cols: TToolButton;
    panel_route_names: TsPanel;
    cmb_route_names_list: TsComboBox;
    GoogleProjects1: TMenuItem;
    btn_params_onlyname_mode: TToolButton;
    tree_popup: TPopupMenu;
    PreprocQuery1: TMenuItem;
    N8: TMenuItem;
    N12: TMenuItem;
    N9: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    CASE1: TMenuItem;
    N15: TMenuItem;
    N10: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    popup_info_caption: TMenuItem;
    popup_info_ref_name: TMenuItem;
    popup_info_object_type: TMenuItem;
    popup_info_ref_title: TMenuItem;
    N21: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    popup_info_req_name: TMenuItem;
    popup_info_req_title: TMenuItem;
    popup_info_req_field_name: TMenuItem;
    popup_info_req_section: TMenuItem;
    popup_info_req_stored: TMenuItem;
    popup_info_req_referencetype: TMenuItem;
    popup_info_req_pick_values: TMenuItem;
    N11: TMenuItem;
    PreprocQuery2: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N22: TMenuItem;
    btn1: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    N23: TMenuItem;
    popup_crop: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    popup_info_req_required: TMenuItem;
    btn_params_nametype_mode: TToolButton;
    popup_hide: TMenuItem;
    popup_hide2: TMenuItem;
    popup_hide3: TMenuItem;
    popup_info_section_detailds_number: TMenuItem;
    sql_query: TSQLQuery;
    the_db_connection: TSQLConnection;
    VirtualStringTree: TVirtualStringTree;
    query_tool_2: TSQLQuery;
    query_tool_3: TSQLQuery;
    N7: TMenuItem;
    tray_popup: TPopupMenu;
    N32: TMenuItem;
    MSIGUID1: TMenuItem;
    N33: TMenuItem;
    filter_ed: TsEdit;
    edit_filter_requisite_name: TsEdit;
    N34: TMenuItem;
    directum3: TMenuItem;
    mniInvalidateNode1: TMenuItem;
    popup_hide4: TMenuItem;
    popup_info_view: TMenuItem;
    dfm1: TMenuItem;
    N38: TMenuItem;
    save_route_schema_dialog: TSaveTextFileDialog;
    task_input_panel: TsPanel;
    task_id_ed: TsEdit;
    popup_info_ref_id: TMenuItem;
    toolbar_refresh_metadata: TToolButton;
    images_toolbar: TImageList;
    tb_ontop: TToolButton;
    JvDockVSNetStyle: TJvDockVSNetStyle;
    sToolBar1: TsToolBar;
    mark_show_reference: TToolButton;
    mark_show_document: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton13: TToolButton;
    ToolButton4: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    mark_required: TToolButton;
    mark_onform: TToolButton;
    filter_bar: TJvToolBar;
    ToolButton3: TToolButton;
    BigImages: TJvImageList;
    JvOfficeMenuItemPainter1: TJvOfficeMenuItemPainter;
    ImageList: TImageList;
    UniConnection1: TUniConnection;
    UniQuery1: TUniQuery;
    SQLServerUniProvider1: TSQLServerUniProvider;
    sSkinManager1: TsSkinManager;
    popup_info_req_pick_value1: TMenuItem;
    popup_info_req_pick_value2: TMenuItem;
    popup_info_req_pick_value3: TMenuItem;
    popup_info_req_pick_value5: TMenuItem;
    popup_info_req_pick_value6: TMenuItem;
    popup_info_req_pick_value4: TMenuItem;
    popup_info_req_pick_value7: TMenuItem;
    popup_info_req_pick_value8: TMenuItem;
    popup_info_req_pick_value9: TMenuItem;
    popup_info_req_show_on_form: TMenuItem;
    popup_info_req_view1: TMenuItem;
    popup_info_req_view2: TMenuItem;
    popup_info_req_view3: TMenuItem;
    popup_info_req_view4: TMenuItem;
    popup_info_req_view5: TMenuItem;
    popup_info_req_view6: TMenuItem;
    popup_info_req_view7: TMenuItem;
    popup_info_req_type: TMenuItem;
    popup_info_req_view8: TMenuItem;
    popup_info_req_view9: TMenuItem;
    popup_info_req_view10: TMenuItem;
    popup_info_req_view11: TMenuItem;
    popup_info_req_view12: TMenuItem;
    popup_info_req_view13: TMenuItem;
    popup_info_req_view14: TMenuItem;
    popup_info_req_view15: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    popup_info_req_if_reference_type: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    metadata_get_popup: TJvPopupMenu;
    N36: TMenuItem;
    N37: TMenuItem;
    menuitemLoadByList: TMenuItem;
    JvDockServer: TJvDockServer;
    procedure N2Click(Sender: TObject);
    procedure treeviewDblClick(Sender: TObject);
    procedure connector_guardTimer(Sender: TObject);
    procedure filter_edChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tool_panelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: integer);
    procedure treeviewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: integer);
    procedure DIRECTUM1Click(Sender: TObject);
    procedure ref_mode_btnClick(Sender: TObject);
    procedure doc_mode_btnClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure treeviewDeletion(Sender: TObject; Node: TTreeNode);
    procedure params_filter_edChange(Sender: TObject);
    procedure task_propertiesMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: integer);
    procedure toolbtn_route_paramsClick(Sender: TObject);
    procedure toolbtn_params_namevalue_modeClick(Sender: TObject);
    procedure toolbtn_properties_4colsClick(Sender: TObject);
    procedure task_propertiesSelectCell(Sender: TObject; ACol,ARow: Integer; var CanSelect: Boolean);
    procedure task_propertiesDblClick(Sender: TObject);
    procedure edit_filter_requisite_nameChange(Sender: TObject);
    procedure cmb_route_names_listChange(Sender: TObject);
    procedure GoogleProjects1Click(Sender: TObject);
    procedure btn_params_onlyname_modeClick(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure treeviewExpanded(Sender: TObject; Node: TTreeNode);
    procedure treeviewCollapsed(Sender: TObject; Node: TTreeNode);
    procedure popup_cropClick(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure treeviewCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btn_params_nametype_modeClick(Sender: TObject);
    procedure treeviewAddition(Sender: TObject; Node: TTreeNode);
    procedure mark_requiredClick(Sender: TObject);
    procedure VirtualStringTreeFreeNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode);

    procedure VirtualStringTreeGetImageIndexEx(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer;
      var ImageList: TCustomImageList);
    procedure VirtualStringTreeCompareNodes(Sender: TBaseVirtualTree;
      Node1, Node2: PVirtualNode; Column: TColumnIndex;
      var Result: Integer);
    procedure VirtualStringTreeHeaderClick(Sender: TVTHeader;
      Column: TColumnIndex; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure VirtualStringTreePaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType);
    procedure VirtualStringTreeContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure VirtualStringTreeDblClick(Sender: TObject);
    procedure mark_show_referenceClick(Sender: TObject);
    procedure mark_show_documentClick(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure MSIGUID1Click(Sender: TObject);
    procedure VirtualStringTreeMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure directum3Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure mniInvalidateNode1Click(Sender: TObject);
    procedure popup_info_viewClick(Sender: TObject);
    procedure dfm1Click(Sender: TObject);
    procedure mark_onformClick(Sender: TObject);
    procedure VirtualStringTreeGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: string);
    procedure ToolButton4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure task_id_edKeyPress(Sender: TObject; var Key: Char);
    procedure N39Click(Sender: TObject);
    procedure preproc_mode_rbtnClick(Sender: TObject);
    procedure preproc_mode_short_rbtnClick(Sender: TObject);
    procedure name_mode_rbtnClick(Sender: TObject);
    procedure full_bdfield_rbtnClick(Sender: TObject);
    procedure bdfield_rbtnClick(Sender: TObject);
    procedure popup_info_ref_nameClick(Sender: TObject);
    procedure popup_info_ref_titleClick(Sender: TObject);
    procedure popup_info_ref_idClick(Sender: TObject);
    procedure popup_info_req_referencetypeClick(Sender: TObject);
    procedure popup_info_req_nameClick(Sender: TObject);
    procedure popup_info_req_field_nameClick(Sender: TObject);
    procedure popup_info_req_titleClick(Sender: TObject);
    procedure popup_info_req_sectionClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure toolbar_refresh_metadataClick(Sender: TObject);
    procedure tb_ontopClick(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure menuitemLoadByListClick(Sender: TObject);
    procedure metadata_get_popupPopup(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure popup_info_req_pick_value1Click(Sender: TObject);
    procedure popup_info_req_pick_value2Click(Sender: TObject);
    procedure popup_info_req_pick_value3Click(Sender: TObject);
    procedure popup_info_req_pick_value4Click(Sender: TObject);
    procedure popup_info_req_pick_value5Click(Sender: TObject);
    procedure popup_info_req_pick_value6Click(Sender: TObject);
    procedure popup_info_req_pick_value7Click(Sender: TObject);
    procedure popup_info_req_pick_value8Click(Sender: TObject);
    procedure popup_info_req_pick_value9Click(Sender: TObject);
    procedure popup_info_req_view10Click(Sender: TObject);
    procedure popup_info_req_view11Click(Sender: TObject);
    procedure popup_info_req_view12Click(Sender: TObject);
    procedure popup_info_req_view13Click(Sender: TObject);
    procedure popup_info_req_view14Click(Sender: TObject);
    procedure popup_info_req_view15Click(Sender: TObject);
    procedure popup_info_req_view1Click(Sender: TObject);
    procedure popup_info_req_view2Click(Sender: TObject);
    procedure popup_info_req_view3Click(Sender: TObject);
    procedure popup_info_req_view4Click(Sender: TObject);
    procedure popup_info_req_view5Click(Sender: TObject);
    procedure popup_info_req_view6Click(Sender: TObject);
    procedure popup_info_req_view7Click(Sender: TObject);
    procedure popup_info_req_view9Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer; var
        CanSelect: Boolean);
    procedure ToolButton1Click(Sender: TObject);

  protected
    procedure WMHotKey(var Message: TMessage); message WM_HOTKEY;
    procedure CreateParams(var Params: TCreateParams);override;

  private
    procedure copyMenuCaptionValueToBuffer(Sender: TObject); overload;
    procedure copyMenuCaptionValueToBuffer(Sender: TObject; subStringDelim :
        string; substringNum:integer); overload;
    procedure PrepareMetaDataList;
    procedure showRequisiteOnForm(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
//    FDebuggerMutex: THandle;
    procedure copyWholeMenuCaptionValueToBuffer(Sender:TObject);
    procedure QuickFilterOnClick(Sender:TObject);
    procedure DropdownLowBar();
    procedure RiseupLowBar();
    procedure FeelRouteNamesCombobox();
    procedure TreeView_GetSelectedObjects( var selected_reference:TPointerDIRReference; var selected_section:TPointerDIRSection; var selected_requisite:TPointerDIRReferenceRequisite );

    function  GetRouteXMLSchemaFromTask( current_task_id:integer ):string;
    function  GetRouteXMLSchemaFromRouteReference( route_name:string ):string;
    procedure FeelTaskPropertiesListUsingTask( taskid:integer; filter:string );
    procedure FeelTaskPropertiesListUsingReference( route_name:string; filter:string );
    procedure ProcessRouteSchemaXML( route_xml_text:string; filter:string );

    procedure OnRun();
    procedure InitMetadata();

    procedure ShowInfo( info_text:string );
    procedure HideInfo();

    procedure StringGrid_Clear();
    procedure StringGrid_AddRow( param_name, param_description, param_type, param_value:string; the_object:TObject );

    procedure Popup_SetContext( current_context:string );

   //запросы к базе 
    function GetRefRecordNameByID( ID:integer ):string;
    procedure PreserveQuickFilter;


  end;

 type
   TTreeViewDisplayMode = ( name_code, code_name );   // Defines enumeration range

 type
  PQuickFilterInfo = ^TQuickFilterInfo;
  TQuickFilterInfo = record
    metadata_type   : TMetadataObjectType;
    name            : string;
    sub_name        : string;
    mark_references : Boolean;
    mark_edocs      : boolean;
 end;


var
  requisites_list_db          : TRequisitesList;
  document_requisites_list_db : TRequisitesList;
  
  references   : TReferenceList;
  DIRAssistant : TDIRAssistant;

  current_param_name          : string;
  current_task_id             : integer;
  current_route_xml_text      : string;
  cur_active_window_class     : string;
  current_object_type         : string;
  current_popup_selected_node : PVirtualNode;
  filter_route_param_name     : string;
  list                        : TList;
  quick_filter_list           : TList;
  currentQuickFilter : integer;
  currentQuickToolButton : TToolButton;


  //предел тестирования. Количество загружаемых элементов. Если 0, значит полностью.
  debug_object_grab_limit : integer;

  global_hotkey_id, global_hotkey_2: integer;

  //Подключение к редактору-----------------------------------------------------
  handle_editor_memo        : THandle;
  handle_editor_window      : THandle;

  handle_task_window        : THandle;
  handle_taskform_statusbar : THandle;

  handle_last_window_handle : THandle;
  handle_last_error         : THandle;

  is_connected_to_editor    : boolean;
  is_connected_to_task_form : boolean;
  //----------------------------------------------------------------------------
  
  filter_by_platform_object_string  : string;
  filter_by_requisite_name_or_title : string;

  //Вставка текста--------------------------------------------------------------
  quotes_mode         : boolean;
  double_quotes_mode  : boolean;
  noquotes_mode       : boolean;
  preproc_mode        : boolean;
  name_mode           : boolean;
  error_window_opened : boolean;
  //----------------------------------------------------------------------------

  db_connection      : ^TSQLConnection;
  query_tool         : ^TSQLQuery;
  subquery_tool      : ^TSQLQuery;
  sub_subquery_tool  : ^TSQLQuery;

  user_app_data_path         : string;
  path_to_configurations_xml : string;
  last_width                 : integer;

  //treeview--------------------------------------------------------------------
  tree_view_display_mode : TTreeViewDisplayMode;
  tree_view_last_root_index       : integer;
  tree_view_last_section_index    : Integer;
  tree_view_last_requisite_index  : integer;

  tree_view_last_root_name        : string;
  tree_view_last_section_name     : string;
  tree_view_last_requisite_name   : string;
  //----------------------------------------------------------------------------

  treeview_expanded_nodes_objects   : TStringList;
  treeview_expanded_nodes_documents : TStringList;

  //Метаданные------------------------------------------------------------------
  reference_requisites:TRequisitesList;
  //----------------------------------------------------------------------------

  globalMousePos      : TPoint;
  metadataGetOnlyList : boolean;
  metadataGetList     : TStringList;


const
  application_name          = 'DIRECTUM Инструментарий';
  url_directum_article_page = 'http://club.directum.ru/post/otkrytye-instrumenty-funkcional-razrabotchika-chast-1-dopolnitelnye-vozmozhnosti-v-standartnom-redaktore---quotdirectum-pomoshhnikquot.aspx';

  document_object_type  = 'Документы';
  reference_object_type = 'Справочники';

implementation

{$R *.dfm}

uses connection_options, sql_comfort_form, debug_form, Math, workroom,
  msi_unit, test_frm, routine_debug, virtual_tree_routine,

  main,
  assistant_options_frm, frm_nonvisual, IsblEditor_frm;

procedure TDirAssistant.Popup_SetContext( current_context:string );
var
  i:integer;
  context_name:string;
begin
 for i:=0 to tree_popup.Items.Count - 1 do
 begin
    if FindSubString( tree_popup.Items.Items[i].Name, 'popup_info_' ) then
    begin
      context_name := SubString( tree_popup.Items.Items[i].Name, 'popup_info_', 2 );
      context_name := SubString( context_name, '_', 1 );
      if context_name <> current_context then
        tree_popup.Items.Items[i].Visible := false
      else
        tree_popup.Items.Items[i].Visible := true;
    end;
 end;
end;

procedure TDIRAssistant.preproc_mode_rbtnClick(Sender: TObject);
begin
  configuration.WriteString('user','insert_type', 'preproc_full');
end;

procedure TDIRAssistant.preproc_mode_short_rbtnClick(Sender: TObject);
begin
  configuration.WriteString('user','insert_type', 'preproc_short');
end;

function TDIRAssistant.GetRefRecordNameByID( ID:integer ):string;
begin
    query_tool.Close;
    query_tool.SQL.Text := ' SELECT NameAn FROM MBAnalit WHERE Analit = ' + inttostr( ID );
    query_tool.Open;

    if query_tool.RecordCount <> 0 then
     result :=  query_tool.Fields[ 0 ].Value
    else
     result := 'Запись не найдена';
end;

procedure TDIRAssistant.ShowInfo( info_text:string );
begin
  info_panel.Visible := true;
  info_panel.Caption := info_text;
end;

procedure TDIRAssistant.HideInfo();
var
  state : TConnectionState;
begin
  info_panel.Visible := false;
  state := the_db_connection.ConnectionState;
  the_db_connection.Close;


end;

procedure TDIRAssistant.DropdownLowBar();
begin
//  tool_panel.Height := 28;
 // ( JvDockServer.BottomDockPanel as  TJvDockVSNETPanel ).DoHideControl( dock_assistant_options );
end;

procedure TDIRAssistant.RiseupLowBar();
begin
  //tool_panel.Height := 197;
end;

procedure TDIRAssistant.StringGrid_Clear();
var
  n,m:integer;
begin
 //Очистить стринггрид
  task_properties.RowCount := 2;
  task_properties.Cells[0,1] :='';
  task_properties.Cells[1,1] :='';
  task_properties.Cells[2,1] :='';
  task_properties.Cells[3,1] :='';
  task_properties.Cells[4,1] :='';
  with task_properties do
    for n:= 0 to ColCount - 1 do
       For m := 0 to RowCount - 1 do
       begin
           Objects[n,m].Free;
           Objects[n,m] := nil;
       end;
end;

procedure TDIRAssistant.StringGrid_AddRow( param_name, param_description, param_type, param_value:string; the_object:TObject );
var
  cur_row:integer;
begin
  cur_row := task_properties.RowCount - 1;
  task_properties.Cells[ 0, cur_row ] := param_name;
  task_properties.Cells[ 1, cur_row ] := param_description;
  task_properties.Cells[ 2, cur_row ] := param_type;
  task_properties.Cells[ 3, cur_row ] := param_value;
  if the_object <> nil then
    task_properties.Objects[ 3, cur_row ] := the_object;

  task_properties.RowCount := task_properties.RowCount + 1;
end;      

procedure TDirAssistant.FeelTaskPropertiesListUsingTask( taskid:integer; filter:string );
begin
  current_route_xml_text := GetRouteXMLSchemaFromTask( taskid );
  ProcessRouteSchemaXML( current_route_xml_text, filter );
end;

procedure TDirAssistant.FeelTaskPropertiesListUsingReference( route_name:string; filter:string );
begin
  current_route_xml_text := GetRouteXMLSchemaFromRouteReference( route_name );
  ProcessRouteSchemaXML( current_route_xml_text, filter );
end;

procedure TDirAssistant.ProcessRouteSchemaXML( route_xml_text:string; filter:string );
var
  params_root_node,param_node,value_node, node                : IXMLNode;
  param_name, param_type, param_description, param_text_value : string;
  param_type_index                                            : integer;
  i,j                                                         : integer;
  i_child                                                     : Integer;
  should_add_param                                            : boolean;
  ref_record_object                                           : TReferenceRecordInfo;
  param_info_object                                           : TObject;

begin
  StringGrid_Clear;
  XMLDocument.XML.Text := route_xml_text;

  if not StringAssigned( XMLDocument.XML.Text ) then exit;

  XMLDocument.Active := true;
  params_root_node   := XMLDocument.DocumentElement.ChildNodes.FindNode( 'Params' );

  // обход параметров одного за другим------------------------------------------
  for i:=0 to params_root_node.ChildNodes.Count - 1 do
  begin
    param_text_value   := '';
    param_node         := params_root_node.ChildNodes.Get( i );
    param_info_object  := nil;

    // собрать данные о параметре-----------------------------------------------
    param_name        := param_node.GetAttributeNS( 'Name','' );
    param_type        := param_node.GetAttributeNS( 'Type','' );
    param_type_index  := StrToInt( param_type );
    param_description := param_node.GetAttributeNS( 'Description','' );

    // для каждого узла Value надо выполнять эти действия

    // Обход значений параметра-------------------------------------------------

      //ЗНАЧЕНИЯ VALUE VALUE
      //Роль, пользователь, признак-------------------------------------------
      if
        ( param_type_index = route_param_type_integer )  or  //целое число
        ( param_type_index = route_param_type_double )  or  //дробное число
        ( param_type_index = route_param_type_pick )  or  //признак
        ( param_type_index = route_param_type_date )  or  //Дата
        ( param_type_index = route_param_type_boolean )  or  //Логическое значение
        ( param_type_index = route_param_type_user ) or  //пользователь
        ( param_type_index = route_param_type_role ) or    //роль
        ( param_type_index = route_param_type_group )    //Группа

      then
      begin
        value_node := param_node.ChildNodes.FindNode('Value');
        if value_node <> nil then
        if value_node.HasAttribute('Value') then
          param_text_value := value_node.GetAttributeNS( 'Value','' );
      end;
     //----------------------------------------------------------------------

     //ЗНАЧЕНИЯ VALUE ID
     //задача, задание, папка
      if ( param_type_index = route_param_type_task ) or
         ( param_type_index = route_param_type_job ) or
         ( param_type_index = route_param_type_folder ) or
         ( param_type_index = route_param_type_edoc ) or
         ( param_type_index = route_param_type_reference_record )
      then
      begin
        value_node := param_node.ChildNodes.FindNode('Value');
        if value_node <> nil then
        if value_node.HasAttribute('ID') then
        begin
          param_text_value := value_node.GetAttributeNS( 'ID','' );

          //Дополнительно распарсить параметр ТМ для записи справочника
          if param_type_index = route_param_type_reference_record then
          begin
           ref_record_object               := TReferenceRecordInfo.Create;
           ref_record_object.ID            := value_node.GetAttributeNS('ID','');
           ref_record_object.ComponentCode := value_node.GetAttributeNS('ComponentCode','');
           ref_record_object.ComponentName := value_node.GetAttributeNS('ComponentName','');
           ref_record_object.Name          := value_node.GetAttributeNS('Name','');
           ref_record_object.SystemCode    := value_node.GetAttributeNS('SystemCode','');
           ref_record_object.Code          := value_node.GetAttributeNS('Code','');
           ref_record_object.ViewCode      := value_node.GetAttributeNS('ViewCode','');
           param_text_value                := GetRefRecordNameByID( ref_record_object.ID );
         end;
        end;
      end;


     // Получить Значение для СТРОКИ
     //<VALUE><VALUE>
     // строка(работает не всегда)
      if ( param_type_index = route_param_type_string )  then
      begin
        value_node := param_node.ChildNodes.FindNode('Value');
        if Assigned( value_node ) then
          value_node       := value_node.ChildNodes.FindNode('Value');
        if Assigned( value_node ) then
        begin
          param_text_value := value_node.Text;
          param_text_value := SubString( param_text_value, '}', 2 );
          param_text_value := Base64DecodeString( param_text_value );
        end;
      end;

      //коллекция строк <VALUE><VALUE>
      if ( param_type_index = route_param_type_collection_string ) then
      begin
        for j:=0 to param_node.ChildNodes.Count - 1 do
        begin
          node := param_node.ChildNodes.Get( j );
          if node.NodeName = 'Value' then
          begin
            value_node := node.ChildNodes.FindNode( 'Value' );
            if Assigned( value_node ) then
              param_text_value := param_text_value + '[ ' + value_node.Text + ' ] ';
          end;
        end;
      end;

      //коллекции VALUE VALUE
      if ( param_type_index = route_param_type_collection_pick ) or
         ( param_type_index = route_param_type_collection_integer ) or
         ( param_type_index = route_param_type_collection_double ) or
         ( param_type_index = route_param_type_collection_boolean ) or
         ( param_type_index = route_param_type_collection_users ) or
         ( param_type_index = route_param_type_collection_groups ) or
         ( param_type_index = route_param_type_collection_roles ) or
         ( param_type_index = route_param_type_user_list ) or
         (  param_type_index = route_param_type_collection_date ) then
      begin
        for j:=0 to param_node.ChildNodes.Count - 1 do
        begin
          node := param_node.ChildNodes.Get( j );
          if node.NodeName = 'Value' then
            param_text_value := param_text_value + '[ ' + node.GetAttributeNS( 'Value','' ) + ' ] ';

        end;
      end;

      //коллекции VALUE ID
      if ( param_type_index = route_param_type_collection_tasks ) or
         ( param_type_index = route_param_type_collection_jobs ) or
         ( param_type_index = route_param_type_collection_edocs ) or
         ( param_type_index = route_param_type_collection_objects ) or
         ( param_type_index = route_param_type_collection_ref_records ) or
         ( param_type_index = route_param_type_collection_edocs ) or
         (  param_type_index = route_param_type_collection_folders ) then
      begin
        for j:=0 to param_node.ChildNodes.Count - 1 do
        begin
          node := param_node.ChildNodes.Get( j );
          if node.NodeName = 'Value' then
            param_text_value := param_text_value + '[ ' + node.GetAttributeNS( 'ID','' ) + ' ] ';

        end;
      end;

    param_type       := DirectumRouteParamTypeToString( param_type_index );
    //--------------------------------------------------------------------------

   //Добавить новую строчку в StringGrid---------------------------------------
    should_add_param := false;
    if ( StringAssigned( filter ) ) and ( FindSubString( param_name, filter )  ) then
      should_add_param := true;
    if not StringAssigned( filter ) then
      should_add_param := true;
    if should_add_param then
    begin
      StringGrid_AddRow( param_name, param_description, param_type, param_text_value, param_info_object  );
    end;
    //--------------------------------------------------------------------------

  end;
  //----------------------------------------------------------------------------

  if task_properties.RowCount > 2 then
    task_properties.RowCount := task_properties.RowCount - 1;

end;


function TDirAssistant.GetRouteXMLSchemaFromRouteReference( route_name:string ):string;
var
  query_part : string;
  step       : integer;
  xml_schema_part   : string;
  xml_schema_string : string;

begin
    xml_schema_string := '';
    step              := 0;
    xml_schema_part   := '122';

    while Length( xml_schema_part ) > 0 do
    begin            
      //Подготовить запрос из шаблона-------------------------------------------
      xml_schema_part := '';
      query_part      := query_form.get_route_xml_from_route_reference.Text;
      query_part      := replace( query_part, '<имя_маршрута>', route_name );
      query_part      := replace( query_part, '<текущий_шаг>', IntToStr( step ) );      
      //------------------------------------------------------------------------

      //Запрос к базе данных----------------------------------------------------
      query_tool.Close;
      query_tool.SQL.Text := query_part;
      query_tool.Open;
      //------------------------------------------------------------------------

      xml_schema_part :=  query_tool.Fields[ 0 ].Text;
      if Length( xml_schema_part ) > 0 then
      begin
        xml_schema_string := xml_schema_string + xml_schema_part;
      end;
      step := step + 1;
      Application.ProcessMessages;
    end;     
    
    result := xml_schema_string;
end;

function TDirAssistant.GetRouteXMLSchemaFromTask( current_task_id:integer ):string;
var
  query_part : string;
  step       : integer;
  xml_schema_part   : string;
  xml_schema_string : string;

begin
    xml_schema_string := '';
    step              := 0;
    xml_schema_part   := '122';

    while Length( xml_schema_part ) > 0 do
    begin
    
      //Подготовить запрос из шаблона-------------------------------------------
      xml_schema_part := '';
      query_part      := query_form.get_routexml_from_task.Text;
      query_part      := replace( query_part, '<номер_задачи>', IntToStr( current_task_id ) );
      query_part      := replace( query_part, '<текущий_шаг>', IntToStr( step ) );
      //------------------------------------------------------------------------

      //Запрос к базе данных----------------------------------------------------
       query_tool.Close;
       query_tool.SQL.Text := query_part;
       query_tool.Open;
      //------------------------------------------------------------------------

      xml_schema_part :=  query_tool.Fields[ 0 ].Text;
      if Length( xml_schema_part ) > 0 then
      begin
        xml_schema_string := xml_schema_string + xml_schema_part;
      end;
      step := step + 1;
      Application.ProcessMessages;
    end;     
    
    result := xml_schema_string;
end;


procedure TDIRAssistant.WMHotKey(var Message: TMessage);
begin
    Application.Restore;
    Application.ShowMainForm:= true;
    Application.BringToFront;
end;

procedure TDIRAssistant.InitMetadata();
begin
  requisites_list_db.Clear;
  document_requisites_list_db.Clear;
  references.Clear;

  requisites_list_db.SetDownloadQuery( query_form.query_RecvAn.Text );
  requisites_list_db.DownloadRequisitesDescription();

  document_requisites_list_db.SetDownloadQuery( query_form.query_RecvEDoc.Text );
  document_requisites_list_db.DownloadRequisitesDescription();

  references.FetchMetadataDescription;
  references.FeelVirtualTree( VirtualStringTree );
end;

procedure TDIRAssistant.CreateParams(var Params: TCreateParams);
 begin
  inherited;
  // Добавляем в расширенный стиль флаг WS_EX_AppWindow,
  // чтобы форма с документом имела кнопку на панели задач.
  Params.ExStyle:=Params.ExStyle or WS_EX_AppWindow
 end;

procedure TDIRAssistant.OnRun();
var
  last_host             : string;
  last_time_connection  : string;
  text_short_cut        : string;
  insert_type : string;
begin

   references := TReferenceList.Create;
  //tool_panel.Height := 28;
//  ( JvDockServer.BottomDockPanel as  TJvDockVSNETPanel ).DoHideControl( dock_assistant_options );

  //Пользовательские настройки--------------------------------------------------
  insert_type := configuration.ReadString('user','insert_type', 'preproc_full');
  insert_type := configuration.ReadString('user','insert_type', 'preproc_short');
  insert_type := configuration.ReadString('user','insert_type', 'name_short');
  insert_type := configuration.ReadString('user','insert_type', 'fieldname_full');
  insert_type := configuration.ReadString('user','insert_type', 'fieldname_short');

  if insert_type = 'preproc_full' then
   dock_assistant_options.preproc_mode_rbtn.Checked := true;
  if insert_type = 'preproc_short' then
    dock_assistant_options.preproc_mode_short_rbtn.Checked := true;
  if insert_type = 'name_short' then
    dock_assistant_options.name_mode_rbtn.Checked := true;
  if insert_type = 'fieldname_full' then
    dock_assistant_options.full_bdfield_rbtn.Checked := true;
  if insert_type = 'fieldname_short' then
    dock_assistant_options.bdfield_rbtn.Checked := true;
  //----------------------------------------------------------------------------

  debug_object_grab_limit := 0;

  //настройка горячей клавиши---------------------------------------------------
  text_short_cut := configuration.ReadString( 'user','hotkey', '' );
  dock_assistant_options.hotkey1.HotKey := TextToShortCut( text_short_cut );
  dock_assistant_options.HotKey1.OnChange( dock_assistant_options.hotkey1 );
  //----------------------------------------------------------------------------

//   прикрепить опции вставки
  dock_assistant_options.ManualDock( JvDockServer.BottomDockPanel );
  ( JvDockServer.BottomDockPanel as  TJvDockVSNETPanel ).Height := 230;
  ( JvDockServer.BottomDockPanel as  TJvDockVSNETPanel ).DoHideControl( dock_assistant_options );


  DIRAssistant.Width   := 340;
  toolbtn_properties_4cols.Click;
//  sSkinManager1.Active := true;
end;



procedure TDIRAssistant.N2Click(Sender: TObject);
begin
  close;
end;

//В эту процедуру передать переменные, получить их означенными выбранными объектами
procedure TDirAssistant.TreeView_GetSelectedObjects( var selected_reference:TPointerDIRReference; var selected_section:TPointerDIRSection; var selected_requisite:TPointerDIRReferenceRequisite );
var
  selected_node : PVirtualNode;
  data : PVSTRecord;
begin
  selected_node := VirtualStringTree.FocusedNode;
  data := VirtualStringTree.GetNodeData( selected_node );
  if Assigned( data ) then
  begin          
    if ( data.node_type = reference_requisite_type ) or
       ( data.node_type = document_requisite_type )
     then
    begin
       selected_requisite := TPointerDIRReferenceRequisite( data.object_pointer );
       selected_section   := TPointerDIRReferenceRequisite( data.object_pointer ).owner_section;
       selected_reference := TPointerDIRReferenceRequisite( data.object_pointer ).owner_object;
    end;

    if data.node_type = section_type then
    begin
       selected_section   := TPointerDIRSection( data.object_pointer );
       selected_reference := TPointerDIRSection( data.object_pointer ).owner_object;
       selected_requisite := nil
    end;

    if ( data.node_type = reference_type ) or
       ( data.node_type = document_type )
       then
    begin
       selected_reference := TPointerDIRReference( data.object_pointer );
       selected_requisite := nil;
       selected_section   := nil;
    end;

  end;
end;

procedure TDIRAssistant.treeviewDblClick(Sender: TObject);
var
  ref_code,
  ref_table_name,
  req_code,
  req_field_name,
  section_code,
  section_table_name : string;

  paste_string       : string;

  section_index      : integer;
  section_is_table   : boolean;

  selected_requisite : TPointerDIRReferenceRequisite;
  selected_reference : TPointerDIRReference;
  selected_section   : TPointerDIRSection;

begin
  {
  paste_string      := '';
  section_is_table  := false;
  section_code      := '';
  section_index     := 0;

  TreeView_GetSelectedObjects( selected_reference, selected_section, selected_requisite );

  //Извлечь значения из полученных объектов-------------------------------------
  if selected_requisite <> nil then
  begin
    req_code         := selected_requisite^.code;
    req_field_name   := selected_requisite^.fieldname;
  end;

  if selected_reference <> nil then
  begin
    ref_code         := selected_reference^.code;
    ref_table_name   := selected_reference^.tablename;
  end;

  if selected_section <> nil then
  begin
    section_code       := selected_section^.code;
    section_table_name := selected_section^.tablename;
    section_is_table   := selected_section^.is_table;
  end;
  //----------------------------------------------------------------------------

  //СПРАВОЧНИК ИЛИ ДОКУМЕНТ-----------------------------------------------------
  if treeview.Selected.Level = 0 then
  begin
    if preproc_mode_rbtn.Checked then
      paste_string := Format( '!%s!', [ref_code] );
      
    if name_mode_rbtn.Checked then
        paste_string := ref_code;

    if bdfield_rbtn.Checked then
      paste_string := ref_table_name;
  end;
  //----------------------------------------------------------------------------

  //СЕКЦИЯ----------------------------------------------------------------------
  if treeview.Selected.Level = 1 then
    begin
       if preproc_mode_rbtn.Checked then
         if section_is_table = true then
           paste_string :=  Format( '!%s.%s!',[ref_code,section_code] );

       if bdfield_rbtn.Checked then
          paste_string := section_table_name;
    end;
  //----------------------------------------------------------------------------

  //РЕКВИЗИТ--------------------------------------------------------------------
  if treeview.Selected.Level = 2 then
    begin

      //Режимы вставки----------------------------------------------------------
      if preproc_mode_rbtn.Checked then
      begin
        if section_is_table = true then
          paste_string := Format( '!%s.%s!.!%s.%s.%s!', [ref_code,section_code,ref_code,section_code,req_code] )
        else                                                                       
          paste_string := Format( '!%s!.!%s.%s!', [ref_code, ref_code, req_code] );
      end;

      if preproc_mode_short_rbtn.Checked then
      begin
        if section_is_table = true then
          paste_string := Format( '!%s.%s.%s!', [ref_code,section_code,req_code] )
        else
          paste_string := Format( '!%s.%s!', [ref_code, req_code] );
      end;

      if name_mode_rbtn.Checked then
        paste_string := req_code;

      if bdfield_rbtn.Checked then
        paste_string := req_field_name;

      if full_bdfield_rbtn.Checked then
        paste_string := ref_table_name + '.' + req_field_name;
      //------------------------------------------------------------------------

    end;
  //----------------------------------------------------------------------------

    PostThroughLayout( paste_string );
    }

end;

procedure TDIRAssistant.connector_guardTimer(Sender: TObject);
var
  len:integer;
  new_handle,
  synedit,
  error_window,
  seek_statusbar:HWND;
  work1, work2, work3: HWND;
  TextEditPane,
  GenericPane1,
  GenericPane2,
  ttaskdialogbutton,
  OutputWindowClass:HWND;
  statusbar_text      : string;
  window_class        : string;
  focused_window      : HWND;
  focused_window_class: string;
  window_title        : string;
  window_text         : PWideChar;
  parent_window_title : string;
  route_title         : string;
  task_id_string      : string;
  dwProcessIdTarget,
  idOfThreadTarget ,
  dwProcessIdMe    ,
  idOfThreadMe      : DWORD;
begin
  //Организация подключения к редактору-----------------------------------------

  //смотрим на активWное окно
  new_handle    := GetForegroundWindow();
  window_class  := GetWindowClassName( new_handle );

  if new_handle <> DIRAssistant.Handle then
  begin
    cur_active_window_class    := window_class;    
    StatusBar.Panels[ 2 ].Text := 'Класс окна: ' + window_class;

    //Подключиться к редактору кода---------------------------------------------
    if ( new_handle <> handle_editor_window ) and ( new_handle <> DIRAssistant.Handle ) then
    begin
      //Редактор кода( событий или обработок )
      if ( window_class = 'TSBISBLEditorForm' ) or ( window_class = 'TSBEventsEditorForm' ) then
      begin
        //если это не то окно которое мы уже захватили, тогда проверяем его на наличие компонента TSLSynEdit в котором выполняется редактирование кода в DIRECTUM
          synedit := FindWindowEx( new_handle, 0, 'TSLSynEdit', nil );
          if synedit <> 0 then
            ConnectToEditor( new_handle );
      end;

      //Сообщение об ошибке-----------------------------------------------------
      if ( window_class = 'TAdvMessageForm' ) or ( window_class = '#32770' ) then
      begin
        //если это не то окно которое мы уже захватили, тогда проверяем его на наличие компонента TSLSynEdit в котором выполняется редактирование кода в DIRECTUM
        error_window := new_handle;
//          if error_window <> handle_last_error then
//          begin
//            handle_last_error := error_window;
//            error_window_opened := true;
//            dock_log.refresh_info.Click;
//          end;
      end;

      if not IsWindow( handle_last_error ) and error_window_opened then
      begin
        error_window_opened := false;
        Application.BringToFront();
//        isbl_debugger.Show;
//        isbl_debugger.BringToFront;

      end;
      //------------------------------------------------------------------------


      //Поддержка работы с MSSQL Studio
      if ( window_class = 'wndclass_desked_gsk' ) then
      begin
        //прицепиться к чужому окну-------------------------------------------------
        idOfThreadTarget   := GetWindowThreadProcessId( new_handle, @dwProcessIdTarget );
        idOfThreadMe       := GetWindowThreadProcessId( Application.Handle, @dwProcessIdMe );
        AttachThreadInput( idOfThreadMe, idOfThreadTarget, true );
        //--------------------------------------------------------------------------
        focused_window             := GetFocus();
        focused_window_class       := GetWindowClassName( focused_window );
        if focused_window_class = 'VsTextEditPane' then
        begin
        //если это не то окно которое мы уже захватили, тогда проверяем его на наличие компонента TSLSynEdit в котором выполняется редактирование кода в DIRECTUM
          handle_editor_window   := new_handle;
          handle_editor_memo     := focused_window;
          is_connected_to_editor := true;
        end;   
        //отцепить поток от себя
        AttachThreadInput(idOfThreadMe, idOfThreadTarget, false);
      end;

      //Если редактор принадлежит редактору событий ТМ
      if ( window_class = 'TSBEventsEditorForm' ) then
      begin
        window_title := GetOwnerWindowTitle( new_handle );
        route_title  := SubString( window_title,'Схема типового маршрута "', 2 );
        route_title  := Replace( route_title, '"', '' );
        FeelTaskPropertiesListUsingReference( route_title,'' );
      end;

    end;
    //--------------------------------------------------------------------------

    //Вывести информацию о доп возможностях-------------------------------------
      if ( window_class = 'TSBEventsEditorForm' ) then
        ShowInfo( 'Доступна вкладка параметров ТМ' )
      else
        HideInfo;
    //--------------------------------------------------------------------------

    //Подключиться к карточке задачи--------------------------------------------
    if ( new_handle <> handle_task_window ) and ( new_handle <> DIRAssistant.Handle ) then
    begin
      if ( window_class = 'TSBTaskForm' ) or ( window_class = 'TSBJobForm' ) then
      begin
        //если это не то окно которое мы уже захватили, тогда проверяем его на наличие компонента TSLSynEdit в котором выполняется редактирование кода в DIRECTUM
          seek_statusbar    := FindWindowEx( new_handle, 0, 'TStatusBar', nil );
          if seek_statusbar <> 0 then
            ConnectToTaskForm( new_handle );
          if is_connected_to_task_form then
          begin
            statusbar_text  := GetStatusBarText( handle_taskform_statusbar, 0 );
            task_id_string := SubString( statusbar_text, 'ИД задачи: ', 2 );
            if StringAssigned( task_id_string ) then
            begin
              current_task_id := StrToInt( task_id_string );
              StatusBar.Panels[ 3 ].Text := IntToStr( current_task_id );
              FeelTaskPropertiesListUsingTask( current_task_id, filter_route_param_name );
            end;
          end;
      end;
    end;
    //--------------------------------------------------------------------------

    //Управление вкладками------------------------------------------------------
    //не придумал пока как использовать переключение вкладок. По идее только при выборе окна без редактора кода.
    //СДЕЛАТЬ. Для каждого хендла хранить состояние вкладок. Если нет сохраненного, тогда выставлять по умолчанию !СДЕЛАТЬ
    if handle_last_window_handle <> new_handle then
    begin
      if is_connected_to_editor then
        if new_handle = handle_editor_window then
        begin
          //PageControl.ActivePage := object_sheet;
          //if DIRAssistant.Width = 442 then DIRAssistant.Width := last_width;
        end;
      if is_connected_to_task_form then
        if new_handle = handle_task_window then
        begin
          PageControl.ActivePage := task_sheet;
        end;
    end;
    //--------------------------------------------------------------------------
  
    //Если считаем что подключены, проверяем состояние окна, не закрыто ли оно----
    if is_connected_to_editor then
      if not IsWindow( handle_editor_memo ) then
        is_connected_to_editor := false;
    if is_connected_to_task_form then
      if not IsWindow( handle_task_window ) then
        is_connected_to_task_form := false;
    //----------------------------------------------------------------------------

    //Просто сообщение в строке статуса. Больше для разработчика чем для пользователя
    if is_connected_to_editor then
      StatusBar.Panels[0].Text := 'Редактор: ' + IntToStr( handle_editor_window )
    else
      StatusBar.Panels[0].Text := 'Нет ред.';

    //Просто сообщение в строке статуса. Больше для разработчика чем для пользователя
    if is_connected_to_task_form then
      StatusBar.Panels[1].Text := 'Карт. задачи: ' + IntToStr( handle_task_window )
    else
      StatusBar.Panels[1].Text := 'Нет карт.';
    //----------------------------------------------------------------------------

  end;
end;

procedure TDIRAssistant.filter_edChange(Sender: TObject);
begin
  try
    references.SetReferenceFilter( filter_ed.Text );
    references.ApplyVirtualVisibility( VirtualStringTree );
    VirtualStringTree.Repaint;

  except
    on e:exception do
    begin
      DebugMessage( 'TDIRAssistant.filter_edChange: необработанное исключение. ' + e.Message );
      ShowDebug();
    end;
  end;
end;

procedure TDIRAssistant.FormCreate(Sender: TObject);
var
  iniFilePath: string;
  metadataListFileName: string;
begin
  //the_db_connection.DBXConnection
  metadataGetOnlyList := false;
  currentQuickFilter  := -1;
  quick_filter_list   := TList.Create;

//  FDebuggerMutex := CreateMutex(nil, True, 'ISB 7.0 Debugger Mutex');

  save_route_schema_dialog.InitialDir := ExtractFilePath( paramstr(0) );
  filter_route_param_name := '';

  //treeview--------------------------------------------------------------------
  tree_view_display_mode            := name_code;
  tree_view_last_root_index         := -1;
  tree_view_last_section_index      := -1;
  tree_view_last_requisite_index    := -1;
  tree_view_last_root_name          := '';
  tree_view_last_section_name       := '';
  tree_view_last_requisite_name     := '';
  treeview_expanded_nodes_objects   := TStringList.Create();
  treeview_expanded_nodes_documents := TStringList.Create();
  //----------------------------------------------------------------------------

  toolbtn_params_namevalue_mode.Click;

  HideInfo();
  PageControl.ActivePage := object_sheet;

  task_properties.Cells[0,0] := 'Название';
  task_properties.Cells[1,0] := 'Описание';
  task_properties.Cells[2,0] := 'Тип';
  task_properties.Cells[3,0] := 'Значение';

  filter_by_platform_object_string := 'Справочники';

  //Подтянуть настройки---------------------------------------------------------
  process_file_name    := ExtractFileName( paramstr(0) );
  work_dir             := ExtractFileDir( paramstr(0) );
  iniFilePath          := work_dir + '\' + process_file_name + '.ini';
  configuration        := TINIFile.Create( iniFilePath );
  //----------------------------------------------------------------------------

  //Начальные настройки---------------------------------------------------------
  db_connection             := Addr(the_db_connection);
  query_tool                := @sql_query;
  subquery_tool             := @query_tool_2;
  sub_subquery_tool         := @query_tool_3;
  is_connected_to_editor    := false;
  is_connected_to_task_form := False;
  current_computer_name     := ReadComputerName();
  //----------------------------------------------------------------------------

  user_app_data_path          := GetEnvironmentVariable('APPDATA');
  path_to_configurations_xml  := user_app_data_path + '\NPO Computer\IS-Builder\configurations.xml';

  requisites_list_db := TRequisitesList.Create( db_connection^ );
  document_requisites_list_db := TRequisitesList.Create( db_connection^ );

end;

procedure TDIRAssistant.FormResize(Sender: TObject);
begin
  //Фильтры растягивать вместе с формой-----------------------------------------
  filter_ed.Width                  := filter_ed.Parent.Width - filter_ed.Left - 5;
  task_id_ed.Width                 := task_id_ed.Parent.Width - task_id_ed.Left - 5;
  params_filter_ed.Width           := params_filter_ed.Parent.Width - params_filter_ed.Left - 5;
  edit_filter_requisite_name.Width := edit_filter_requisite_name.Parent.Width - edit_filter_requisite_name.Left - 5;
  cmb_route_names_list.Width       := cmb_route_names_list.Parent.Width - cmb_route_names_list.Left - 5;
  //----------------------------------------------------------------------------
end;

procedure TDIRAssistant.full_bdfield_rbtnClick(Sender: TObject);
begin
  configuration.WriteString('user','insert_type', 'fieldname_full');
end;

procedure TDIRAssistant.tool_panelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: integer);
begin
  RiseupLowBar();
end;

procedure TDIRAssistant.treeviewMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: integer);
begin
  DropdownLowBar();
end;

procedure TDIRAssistant.DIRECTUM1Click(Sender: TObject);
begin
  OpenUrl('http://club.directum.ru');
end;

procedure TDIRAssistant.ref_mode_btnClick(Sender: TObject);
begin
    filter_by_platform_object_string := 'Справочники';
    PageControl.ActivePage := object_sheet;
end;

procedure TDIRAssistant.doc_mode_btnClick(Sender: TObject);
begin
    filter_by_platform_object_string := 'Документы';
    PageControl.ActivePage := object_sheet;
end;

procedure TDIRAssistant.N5Click(Sender: TObject);
begin
  OpenUrl( url_directum_article_page );
end;

procedure TDIRAssistant.N4Click(Sender: TObject);
begin
  OpenUrl( url_directum_article_page );
end;

procedure TDIRAssistant.N6Click(Sender: TObject);
begin
  if not connection_options_form.Visible then
    connection_options_form.ShowModal
  else
    connection_options_form.BringToFront;
end;

procedure TDIRAssistant.name_mode_rbtnClick(Sender: TObject);
begin
  configuration.WriteString('user','insert_type', 'name_short');
end;

procedure TDIRAssistant.FormDestroy(Sender: TObject);
begin
  UnregisterHotKey( Handle, global_hotkey_id);
  GlobalDeleteAtom( global_hotkey_id );
//  CloseHandle(FDebuggerMutex);
end;

procedure TDIRAssistant.FormHide(Sender: TObject);
begin
 window.OnChildClose();
end;

procedure TDIRAssistant.toolbar_refresh_metadataClick(Sender: TObject);
begin

    if db_connection.Connected then
    begin
       Application.Title    := application_name + ' {' + connection_options_form.db_edit.Text + '}';
       DIRAssistant.Caption := Application.Title;
       DIRAssistant.FeelRouteNamesCombobox;
       DIRAssistant.InitMetadata();
    end;

    if not db_connection.Connected then
    begin
      connection_options_form.ShowModal;
      if db_connection.Connected then
      begin
        Application.Title    := application_name + ' {' + connection_options_form.db_edit.Text + '}';
        DIRAssistant.Caption := Application.Title;
        DIRAssistant.FeelRouteNamesCombobox;
        DIRAssistant.InitMetadata();
      end;
    end;
end;

procedure TDIRAssistant.ToolButton15Click(Sender: TObject);
begin
  VirtualStringTree.FullExpand();
end;

procedure TDIRAssistant.ToolButton2Click(Sender: TObject);
begin
  if ( Sender as TToolButton ).Down then
  begin
    SetWindowLong(Self.Handle, GWL_HWNDPARENT, GetDesktopWindow);
    SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE   or SWP_NOSIZE);
  end
  else
  begin
    SetWindowLong(Self.Handle, GWL_HWNDPARENT, window.Handle);
    SetWindowPos(Self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE   or SWP_NOSIZE);
  end;
end;

procedure TDIRAssistant.QuickFilterOnClick(Sender:TObject);
var
  filter_info : PQuickFilterInfo;
begin

  (*TODO: extracted code
  if currentQuickFilter <> -1 then
  begin
      filter_info                    := quick_filter_list.Items[ currentQuickFilter ];
      filter_info.name               := filter_ed.Text;
      filter_info.sub_name           := edit_filter_requisite_name.Text;
      filter_info.mark_references    := mark_show_reference.Down;
      filter_info.mark_edocs         := mark_show_document.Down;
      currentQuickToolButton.Caption := filter_info.name;
      currentQuickToolButton.Down    := False;
  end;
  *)
  PreserveQuickFilter;

  filter_info                     := quick_filter_list.Items[ ( Sender as TToolButton ).Tag ];
  filter_ed.Text                  := filter_info.name;
  edit_filter_requisite_name.Text := filter_info.sub_name;
  mark_show_reference.Down        := filter_info.mark_references;
  mark_show_document.Down         := filter_info.mark_edocs;
  currentQuickFilter              := (Sender as TToolButton).Tag;
  currentQuickToolButton          := (Sender as TToolButton);
    currentQuickToolButton.Down := True;

end;

procedure TDIRAssistant.ToolButton3Click(Sender: TObject);
var
  toolbutton  : TToolButton;
  filter_info : PQuickFilterInfo;
begin
  if currentQuickFilter <> -1 then
  begin
      currentQuickToolButton.Down    := False;
  end;

  filter_bar.Visible := true;

  toolbutton        := TToolButton.Create( filter_bar );
  toolbutton.Style  := tbsCheck;
  toolbutton.Parent := filter_bar;

  if mark_show_reference.down then
    toolbutton.ImageIndex := 1;

  if mark_show_document.down then
    toolbutton.ImageIndex := 2;

  if mark_show_reference.down and mark_show_document.down then
    toolbutton.ImageIndex := 0;

  New(filter_info);
  filter_info.metadata_type   := reference_type;
  filter_info.name            := filter_ed.Text;
  filter_info.sub_name        := edit_filter_requisite_name.Text;
  filter_info.mark_references := mark_show_reference.Down;
  filter_info.mark_edocs      := mark_show_document.Down;

  quick_filter_list.Add( filter_info );
  toolbutton.Tag              := quick_filter_list.Count - 1;
  toolbutton.Hint             := filter_info.name + '  ' + filter_info.sub_name;
  toolbutton.Caption          := toolbutton.Hint;
  toolbutton.OnClick          := QuickFilterOnClick;
  currentQuickFilter          := toolbutton.Tag;
  currentQuickToolButton      := toolbutton;
  currentQuickToolButton.Down := true;
end;

procedure TDIRAssistant.ToolButton4Click(Sender: TObject);
begin
  VirtualStringTree.FullCollapse();
end;

procedure TDIRAssistant.treeviewDeletion(Sender: TObject; Node: TTreeNode);
begin
  Dispose( node.data ) ;
end;

procedure TDIRAssistant.params_filter_edChange(Sender: TObject);
begin
  filter_route_param_name := params_filter_ed.Text;
  ProcessRouteSchemaXML( current_route_xml_text, filter_route_param_name );
end;

procedure TDIRAssistant.task_propertiesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: integer);
begin
  DropdownLowBar();
end;

procedure TDIRAssistant.toolbtn_route_paramsClick(Sender: TObject);
begin
  PageControl.ActivePage := task_sheet;
end;

procedure TDIRAssistant.toolbtn_params_namevalue_modeClick(Sender: TObject);
begin
  task_properties.ColWidths[ 0 ] := Round( task_properties.Width / 2 );
  task_properties.ColWidths[ 1 ] := 0;
  task_properties.ColWidths[ 2 ] := 0;
  task_properties.ColWidths[ 3 ] := Round( task_properties.Width / 2 ) - 5;
end;

procedure TDIRAssistant.toolbtn_properties_4colsClick(Sender: TObject);
begin
  task_properties.ColWidths[ 0 ] := Round( task_properties.Width / 4 );
  task_properties.ColWidths[ 1 ] := Round( task_properties.Width / 4 );
  task_properties.ColWidths[ 2 ] := Round( task_properties.Width / 4 );
  task_properties.ColWidths[ 3 ] := Round( task_properties.Width / 4 ) - 5;
end;

procedure TDIRAssistant.task_propertiesSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ACol = 0
  then
    current_param_name := task_properties.Cells[ ACol,ARow ];
end;

procedure TDIRAssistant.tb_ontopClick(Sender: TObject);
begin
  if ( Sender as TToolButton ).Down then
  begin
    SetWindowLong(Self.Handle, GWL_HWNDPARENT, GetDesktopWindow);
    SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE   or SWP_NOSIZE);
  end
  else
  begin
    SetWindowLong(Self.Handle, GWL_HWNDPARENT, window.Handle);
    SetWindowPos(Self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE   or SWP_NOSIZE);
  end;
end;

procedure TDIRAssistant.task_id_edKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
     current_task_id := StrToInt( task_id_ed.Text );
//     StatusBar.Panels[ 3 ].Text := IntToStr( current_task_id );
     FeelTaskPropertiesListUsingTask( current_task_id, filter_route_param_name );
  end;
end;

procedure TDIRAssistant.task_propertiesDblClick(Sender: TObject);
var
  paste_string:string;
begin
  paste_string := current_param_name;
  if paste_string <> '' then PostThroughLayout( paste_string );
end;

procedure TDIRAssistant.edit_filter_requisite_nameChange(Sender: TObject);
begin
  references.SetRequisiteFilter( edit_filter_requisite_name.text );
  references.ApplyVirtualVisibility( VirtualStringTree );
  VirtualStringTree.Repaint;
end;

procedure TDIRAssistant.FeelRouteNamesCombobox();
begin
  query_tool.Close;
  query_tool.SQL.Text := ' SELECT NameAn FROM MBAnalit WHERE Vid = ( SELECT Vid FROM MBVIdAn WHERE Kod = ''ТМТ'' ) ';
  query_tool.Open;

  cmb_route_names_list.Items.Clear;
  while not  query_tool.Eof do
  begin
    cmb_route_names_list.Items.Add(  query_tool.Fields[0].Text );
     query_tool.Next;
  end;

end;

procedure TDIRAssistant.cmb_route_names_listChange(Sender: TObject);
begin
  FeelTaskPropertiesListUsingReference( cmb_route_names_list.Text, '' );
end;

procedure TDIRAssistant.GoogleProjects1Click(Sender: TObject);
begin
  OpenUrl( 'http://code.google.com/p/directum-assistant/' );
end;

procedure TDIRAssistant.btn_params_onlyname_modeClick(Sender: TObject);
begin                                                    
  task_properties.ColWidths[ 0 ] := task_properties.Width;
  task_properties.ColWidths[ 1 ] := 0;
  task_properties.ColWidths[ 2 ] := 0;
  task_properties.ColWidths[ 3 ] := 0;
end;

procedure TDIRAssistant.Button1Click(Sender: TObject);
var
  RegValue, // указатель на подключи главного
  Registry: TRegistry; // указатель на главный ключ
  SubKeys, // список подключей
  Names: TStringList; // список всех главных ключей
  i, ki: integer; // индексы
  s: string; // строка
begin
  // инициализация
  Registry := TRegistry.Create;
  RegValue := TRegistry.Create;
  Names := TStringList.Create;
  SubKeys := TStringList.Create;
  try
    Registry.RootKey := HKEY_CLASSES_ROOT;
    RegValue.RootKey := HKEY_CLASSES_ROOT;
    // получаем все компоненты из CLSID
    Registry.OpenKey('CLSID',FALSE);
    Registry.GetKeyNames(Names);
    Registry.CloseKey;

    i := 0;
    repeat
      Registry.OpenKey(Names[i],FALSE);
      // откроем ключ, по содержанию которого можно определить
      // ActiveX-компонент это или нетn
      RegValue.OpenKey('CLSID\'+Names[i]+'\InProcHandler32',FALSE);

      { ---  1  --- }
      // попытаемся прочитать значение по умолчанию
      s := RegValue.ReadString('');
      // если не равно значение, то этот компонент мне не нужен
      if s <> 'ole32.dll' then
        Names.Delete(i)
      else
      begin
        inc(i);
        Names[i] := Names[i]
      end;

    until i = Names.Count;
    // выведем все найденные ActiveX-компоненты
    DebugMessage(Names.Text);
  finally
    // завершение
    SubKeys.Free;
    Names.Free;
    RegValue.Free;
    Registry.Free;
  end;
  ShowDebug();
end;


procedure TDIRAssistant.ToolButton8Click(Sender: TObject);
begin
  tree_view_display_mode := name_code;
  VirtualStringTree.Repaint;

end;

procedure TDIRAssistant.ToolButton9Click(Sender: TObject);
begin
  tree_view_display_mode := code_name;
  VirtualStringTree.Repaint;
end;

procedure TDIRAssistant.treeviewExpanded(Sender: TObject; Node: TTreeNode);
var
  index:integer;
  treeview_expanded_nodes : ^TStringList;
begin

  if current_object_type = 'Справочники' then
    treeview_expanded_nodes := @treeview_expanded_nodes_objects;
  if current_object_type = 'Документы' then
    treeview_expanded_nodes := @treeview_expanded_nodes_documents;
    
  //раскрыли
  index := treeview_expanded_nodes.IndexOf( TPointerDIRReference( node.Data ).uid );
  if index = -1 then
    treeview_expanded_nodes.Add( TPointerDIRReference( node.Data ).uid  );

  if node.Level = 0 then
  begin
    tree_view_last_root_index := node.Index;
    tree_view_last_root_name  := node.Text;
  end;

  if node.Level = 1 then
  begin
    tree_view_last_section_index := node.Index;
    tree_view_last_section_name  := node.Text;
  end;

  if node.Level = 2 then
  begin
    tree_view_last_requisite_index := node.Index;
    tree_view_last_requisite_name  := node.Text;
  end;

end;

procedure TDIRAssistant.treeviewCollapsed(Sender: TObject;
  Node: TTreeNode);
var
  index:integer;
  treeview_expanded_nodes : ^TStringList;
begin

  if current_object_type = 'Справочники' then
    treeview_expanded_nodes := @treeview_expanded_nodes_objects;

  if current_object_type = 'Документы' then
    treeview_expanded_nodes := @treeview_expanded_nodes_documents;

  //раскрыли
  index := treeview_expanded_nodes.IndexOf( TPointerDIRReference( node.Data ).uid );
  if index <> -1 then
    treeview_expanded_nodes.Delete( index );

  if node.Level = 0 then
  begin
    tree_view_last_root_index := -1;
    tree_view_last_root_name  := '';

  end;

  if node.Level = 1 then
  begin
    tree_view_last_section_index := -1;
    tree_view_last_section_name  := '';
  end;

  if node.Level = 2 then
  begin
    tree_view_last_requisite_index := -1;
    tree_view_last_requisite_name  := '';
  end;

end;
                     
function BoolToYesString( boolean_value: boolean ):string;
begin
  if boolean_value then result := 'Да'
  else
  result := 'Нет';
end;

procedure TDIRAssistant.popup_cropClick(Sender: TObject);
var
  node:PVirtualNode;
  requisite_name, reference_name : string;
  data : PVSTRecord;
begin
  node  := VirtualStringTree.FocusedNode;
  if Assigned( node ) then
  begin

    //Собираем данные. после установки фильтра ноды умрут вместе с Data
    data := VirtualStringTree.GetNodeData( node );

    if Assigned( data ) then
    begin

      if ( data.node_type = reference_requisite_type  ) or
         ( data.node_type = document_requisite_type )
      then
      begin
        reference_name := TPointerDIRReferenceRequisite( data.object_pointer ).owner_object.name;
        requisite_name := TPointerDIRReferenceRequisite( Data.object_pointer ).name;
      end;
      
      if ( data.node_type = reference_type ) or ( data.node_type = document_type ) then
      begin
        reference_name := TPointerDIRReference( data.object_pointer ).name;
      end;

      //Применяем настройки
      if ( data.node_type = reference_requisite_type  ) or
         ( data.node_type = document_requisite_type ) then
      begin
        filter_ed.Text := reference_name;
        edit_filter_requisite_name.Text := requisite_name;
      end;

      if ( data.node_type = reference_type ) or ( data.node_type = document_type ) then
      begin
        filter_ed.Text := reference_name;
        edit_filter_requisite_name.Text := '';
  //      treeview.Items.Item[0].Expand( true );
      end;
      
    end;

  end;   
end;

procedure TDIRAssistant.N24Click(Sender: TObject);
begin
  filter_ed.Text := '';
  edit_filter_requisite_name.Text := '';
end;

procedure TDIRAssistant.treeviewCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin

//Подчеркнуть обязательные
  if node.Level = 2 then
  if mark_required.Down then
  if TPointerDirRequisite( node.Data ).required then
    Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsUnderline];

end;

procedure TDIRAssistant.bdfield_rbtnClick(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.btn1Click(Sender: TObject);
var
  route_schema:TStringList;
begin
  if save_route_schema_dialog.Execute then
  begin
    route_schema:= TStringList.Create();
    route_schema.Text := GetRouteXMLSchemaFromRouteReference(  cmb_route_names_list.Text );
    route_schema.SaveToFile( save_route_schema_dialog.FileName);
  end;
end;

procedure TDIRAssistant.btn3Click(Sender: TObject);
begin
  text := current_route_xml_text;
  EditText_SetXMLHightlighter();
  EditText( text );
end;

procedure TDIRAssistant.btn_params_nametype_modeClick(Sender: TObject);
begin
  task_properties.ColWidths[ 0 ] := Round( task_properties.Width / 2 );
  task_properties.ColWidths[ 1 ] := 0;
  task_properties.ColWidths[ 2 ] := Round( task_properties.Width / 2 ) - 5;
  task_properties.ColWidths[ 3 ] := 0;
end;

procedure TDIRAssistant.copyMenuCaptionValueToBuffer(Sender: TObject);
var
  menuCaption: string;
  refCopyText: string;
begin
  menuCaption      := (Sender as TMenuItem).Caption;
  menuCaption      := replace( menuCaption, '&', '' );
  refCopyText      := SubString( menuCaption, ': ', 2 );
  Clipboard.AsText := refCopyText;
  window.TrayIcon.BalloonHint('Значение скопировано в буфер', refCopyText );
end;

procedure TDIRAssistant.copyMenuCaptionValueToBuffer(Sender: TObject; subStringDelim
    : string; substringNum:integer);
var
  menuCaption : string;
  refCopyText : string;
begin
  menuCaption      := (Sender as TMenuItem).Caption;
  menuCaption      := replace( menuCaption, '&', '' );
  refCopyText      := SubString( menuCaption, subStringDelim, subStringNum );
  Clipboard.AsText := refCopyText;
  window.TrayIcon.BalloonHint('Значение скопировано в буфер', refCopyText );
end;

procedure TDIRAssistant.copyWholeMenuCaptionValueToBuffer(Sender:TObject);
var
  menuCaption: string;
  refCopyText: string;
begin
  menuCaption      := (Sender as TMenuItem).Caption;
  Clipboard.AsText := menuCaption;
  window.TrayIcon.BalloonHint('Значение скопировано в буфер', menuCaption );
end;

procedure TDIRAssistant.treeviewAddition(Sender: TObject; Node: TTreeNode);
var
  additional_requisite : TPointerDIRRequisite;
  additional_reference : TPointerDIRReference;
  additional_section   : TPointerDIRSection;
begin

if Node.Level = 0 then
begin
  additional_reference := TPointerDIRReference( node.Data );

  if tree_view_display_mode = name_code then
    Node.Text := additional_reference.name + ' [' + additional_reference.code + ']' ;
  if tree_view_display_mode = code_name then
    Node.Text := additional_reference.code + ' [' + additional_reference.name + ']' ;

  Node.Text := node.Text + '[' + additional_reference.tablename + ']';

  if current_object_type = reference_object_type then
  begin
    Node.ImageIndex    := pic_index_reference;
    Node.SelectedIndex := pic_index_reference;
  end;
  if current_object_type = document_object_type then
  begin
    Node.ImageIndex    := pic_index_edoc_custom;
    Node.SelectedIndex := pic_index_edoc_custom;
  end;                               

end;

  if Node.Level = 1 then
  begin
    additional_section := TPointerDIRSection( node.Data );    
    node.ImageIndex    := pic_index_module;
    node.SelectedIndex := pic_index_module;
    {
    if additional_section.index > 0 then
      Node.Text        := node.Text + Format( ' (%s)', [IntToStr( additional_section.index )] );
    }
  end;

  if Node.Level = 2 then
  begin
    additional_requisite := TPointerDIRRequisite( node.Data );

    if tree_view_display_mode = name_code then
      Node.Text := additional_requisite.name + ' [' + additional_requisite.code + ']' ;

    if tree_view_display_mode = code_name then
      Node.Text := additional_requisite.code + ' [' + additional_requisite.name + ']' ;

    node.Text := node.Text + Format( ' [%s]', [ additional_requisite.fieldname ] );

    if current_object_type = reference_object_type then
    begin
      Node.ImageIndex    := pic_index_ref_requisite;
      Node.SelectedIndex := pic_index_ref_requisite;
    end;
    if current_object_type = document_object_type then
    begin
      Node.ImageIndex    := pic_index_edoc_requisite;
      Node.SelectedIndex := pic_index_edoc_requisite;
    end;

    //если обязательный
    if additional_requisite.required then
    begin
      Node.Text := node.Text + ' [*]';
    end;
  end;



end;

procedure TDIRAssistant.mark_requiredClick(Sender: TObject);
begin
  VirtualStringTree.Repaint;
end;

procedure TDIRAssistant.VirtualStringTreeFreeNode(
  Sender: TBaseVirtualTree; Node: PVirtualNode);
var
 Data: PVSTRecord;
begin
 Data := Sender.GetNodeData(Node);
 if Assigned(Data) then
  Finalize(Data^);                
end;



procedure TDIRAssistant.VirtualStringTreeGetImageIndexEx(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
  Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer;
  var ImageList: TCustomImageList);
var
 Data: PVSTRecord;
 requisite : TPointerDIRReferenceRequisite;
begin

Data := Sender.GetNodeData(Node);
if Assigned( Data ) then
begin

  if Column =1 then
  begin
    requisite  := TPointerDIRReferenceRequisite( Data.object_pointer );
    {
    if requisite.the_requisite.his_type = 'Строка' then
    begin

    end;
    }
  end;

  if Column = 0 then
    begin
       ImageList  := nonvisual.ImageList; // Обычные картинки

       begin
          if ( data.node_type = reference_type ) or ( data.node_type = document_type ) then
          begin
            ImageIndex := pic_index_reference;
          end;

         if Data.node_type = document_type then
          begin
            ImageIndex := pic_index_edoc_custom;
          end;

         if Data.node_type = actions_section_type then
          begin
            ImageIndex := pic_index_script;
          end;

         if Data.node_type = section_type then
          begin
            ImageIndex := pic_index_module;
          end;

         if Data.node_type = requisite_action_type then
          begin
            ImageIndex := pic_index_script;
          end;

          if Data.node_type = reference_requisite_type then
          begin
            ImageIndex := pic_index_ref_requisite;
          end;

          if Data.node_type = document_requisite_type then
          begin
            ImageIndex := pic_index_edoc_requisite;
          end;

          if Data.node_type = folder_type then
          begin
            ImageIndex := pic_index_folder;
          end;

          if Data.node_type = view_type then
          begin
            ImageIndex := pic_index_view;
          end;

          if Data.node_type = control_type then
          begin
            if TViewFormControl( data.object_pointer ).control_type = 'TSLPageControl' then
              ImageIndex := pic_index_pagecontrol;

            if TViewFormControl( data.object_pointer ).control_type = 'TSLTabSheet' then
              ImageIndex := pic_index_tabsheet;

            if TViewFormControl( data.object_pointer ).control_type = 'TSLGroupBox' then
              ImageIndex := pic_index_group;

            if TViewFormControl( data.object_pointer ).control_type = 'TSLRecordAction' then
              ImageIndex := pic_index_script;

            if TViewFormControl( data.object_pointer ).control_type = 'TActionList' then
              ImageIndex := pic_index_script;

            if TViewFormControl( data.object_pointer ).metadata_type = requisite_type then
              ImageIndex := pic_index_ref_requisite;

            if TViewFormControl( data.object_pointer ).metadata_type = action_type then
              ImageIndex := pic_index_script;
          end;
       end;
      end;

end;

end;

procedure TDIRAssistant.VirtualStringTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
 Data    : PVSTRecord;
 control : TViewFormControl;
begin
 Data := Sender.GetNodeData(Node);
 if Assigned( Data ) then
 begin
   if tree_view_display_mode = name_code then
   begin
      //ПРЕДСТАВЛЕНИЕ
      if ( data.node_type = view_type ) then
      begin
        data.column1 := TPointerDirView( Data.object_pointer ).name;
        Data.column2 := TPointerDirView( Data.object_pointer ).code;
      end;

      //ПАПКА
      if ( data.node_type = folder_type )  then
      begin
          Data.column1 := data.text;
          data.column2 := 'Папка';
      end;

      //ДЕЙСТВИЕ справочника или документа
      if ( Data.node_type = requisite_action_type ) then
      begin
        data.column1 := TPointerDIRReferenceRequisite( data.object_pointer ).name;
        Data.column2 := TPointerDIRReferenceRequisite( data.object_pointer ).code;
      end;

      //СПРАВОЧНИК ИЛИ ДОКУМЕНТ
      if ( data.node_type = reference_type ) or ( data.node_type = document_type ) then
      begin
        data.column1 := TPointerDIRReference( Data.object_pointer ).name;
        data.column2 := TPointerDIRReference( Data.object_pointer ).code;
        data.column3 := TPointerDIRReference( Data.object_pointer ).tablename;
      end;

      //СЕКЦИЯ или СЕКЦИЯ ДЕЙСТВИЙ
      if ( Data.node_type = section_type ) or ( Data.node_type = actions_section_type )
      then
      begin
        data.column1 := TPointerDIRSection( Data.object_pointer ).name;
        Data.column2 := TPointerDIRSection( Data.object_pointer ).code;
        data.column3 := TPointerDIRSection( Data.object_pointer ).tablename;
      end;

      //РЕКВИЗИТ документа или справочника
      if ( data.node_type = reference_requisite_type  ) or ( data.node_type = document_requisite_type ) then
      begin
        data.column1 := TPointerDIRReferenceRequisite( Data.object_pointer ).name;
        data.column2 := TPointerDIRReferenceRequisite( Data.object_pointer ).the_requisite.code;
        data.column3 := TPointerDIRReferenceRequisite( Data.object_pointer ).the_requisite.fieldname;
      end;


//ЭЛЕМЕНТЫ ПРЕДСТАВЛЕНИЯ--------------------------------------------------------
      //если узел представляет собой элемент управления формы
      if Data.node_type = control_type then
      begin

        control := TViewFormControl( Data.object_pointer );

        // если тип метаданных компонента реквизит
        if control.metadata_type = requisite_type then
        begin
          try
            data.column1 := control.ref_requisite.name;
            data.column2 := control.ref_requisite.the_requisite.code;
            Data.column3 := control.ref_requisite.the_requisite.fieldname;
          except
            ShowMessage( control.control_type );
          end;
        end;

        //если тип метаданных компонента действие
        if control.metadata_type = action_type then
        begin
          if Column = 0 then

            if Assigned( control.ref_requisite ) then
              Data.column1 := control.ref_requisite.name
            else
              data.column1 := control.name + '(реквизит не найден)';

          if column = 1 then
          begin
            if control.control_type = 'TSLStandardAction' then
              Data.column2 := control.params.GetValueAsString('Code');
            if control.control_type <> 'TSLStandardAction' then
              data.column2 := control.params.GetValueAsString('RequisiteCode');
          end;

        end;

        if control.metadata_type = control_type then
        begin
          if Column = 0 then
          begin
            celltext := control.name;

            if control.control_type = 'TActionList' then
              data.column1 := 'Действия';

            if control.control_type = 'TSLPageControl' then
               data.column1 := 'Вкладки';

            if control.control_type = 'TcxGrid' then
               data.column1 := 'Таблица';

            if control.control_type = 'TSLTabSheet' then
               data.column1 := control.params.GetValueAsString( 'Caption' ) + ' (вкладка)';

            if control.control_type = 'TSLGroupBox' then
               data.column1 := control.params.GetValueAsString( 'Caption' ) + ' (группа)';
          end;

          if column = 1 then
          begin
             data.column2 := control.control_type;
          end;

          if column = 2 then
             data.column3 := control.name;
        end;


      end;

        if Column = 0 then
          celltext := Data.column1;
        if column = 1 then
          celltext := Data.column2;


   end;


   if tree_view_display_mode = code_name then
   begin
            if ( data.node_type = reference_type ) or ( data.node_type = document_type ) then
      begin
        if Column = 0 then
          celltext := TPointerDIRReference( Data.object_pointer ).code;
        if column = 1 then
          celltext := TPointerDIRReference( Data.object_pointer ).name;
        if column = 2 then
          celltext := TPointerDIRReference( Data.object_pointer ).tablename;
      end;

      if Data.node_type = section_type then
      begin
        if Column = 0 then
          celltext := TPointerDIRSection( Data.object_pointer ).code;
        if column = 1 then
          celltext := TPointerDIRSection( Data.object_pointer ).name;
        if column = 2 then
          celltext := TPointerDIRSection( Data.object_pointer ).tablename;
      end;

            if ( data.node_type = reference_requisite_type  ) or ( data.node_type = document_requisite_type ) then
      begin
        if Column = 0 then
          celltext := TPointerDIRReferenceRequisite( Data.object_pointer ).code;
        if column = 1 then
          celltext := TPointerDIRReferenceRequisite( Data.object_pointer ).the_requisite.name;
        if column = 2 then
          celltext := TPointerDIRReferenceRequisite( Data.object_pointer ).the_requisite.fieldname;
      end;
   end;



 end;
end;

procedure TDIRAssistant.VirtualStringTreeCompareNodes(
  Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
  Column: TColumnIndex; var Result: Integer);
begin
  Result := CompareStr( VirtualStringTree.Text[Node1, 0], VirtualStringTree.Text[Node2, 0]);
end;

procedure TDIRAssistant.VirtualStringTreeHeaderClick(Sender: TVTHeader;
  Column: TColumnIndex; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if Button = mbLeft then
  begin
    // Меняем индекс сортирующей колонки на индекс колонки,
    // которая была нажата.
    VirtualStringTree.Header.SortColumn := Column;
    // Сортируем всё дерево относительно этой колонки
    // и изменяем порядок сортировки на противополжный
    if VirtualStringTree.Header.SortDirection = sdAscending then
    begin
      VirtualStringTree.Header.SortDirection := sdDescending;
      VirtualStringTree.SortTree(Column, VirtualStringTree.Header.SortDirection);
    end
    else begin
      VirtualStringTree.Header.SortDirection := sdAscending;
      VirtualStringTree.SortTree(Column, VirtualStringTree.Header.SortDirection);
    end;
  end;
end;

procedure TDIRAssistant.VirtualStringTreePaintText(
  Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
 Data: PVSTRecord;
begin
 Data := Sender.GetNodeData(Node);
 if Assigned( Data ) then
 begin
  if ( data.node_type = reference_type ) or ( data.node_type = document_type ) then
  begin

  end;

  if Data.node_type = section_type then
  begin

  end;

  //Подчеркнуть обязательные реквизиты------------------------------------------
  if ( data.node_type = reference_requisite_type  ) or ( data.node_type = document_requisite_type ) then
  begin
   if TPointerDIRReferenceRequisite( Data.object_pointer ).required then
   if mark_required.Down then
      TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsUnderline]
    else
      TargetCanvas.Font.Style := TargetCanvas.Font.Style - [fsUnderline];

   // Выделить реквизиты на форме------------------------------------------------
   if TPointerDIRReferenceRequisite( Data.object_pointer ).on_form then
   if mark_onform.Down then
      TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold]
    else
      TargetCanvas.Font.Style := TargetCanvas.Font.Style - [fsBold];

  end;


 end;
end;

procedure TDIRAssistant.VirtualStringTreeContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  selected_node          : PVirtualNode;
  treeView_under         : TVirtualStringTree;
  reference_or_document  : TPointerDIRReference;
  section                : TPointerDIRSection;
  requisite              : TPointerDIRReferenceRequisite;
  data                   : PVSTRecord;

  i                      : Integer;
  menuItem               : TMenuItem;
  pickVal                : string;
  pickValuesString       : string;

begin
   treeView_under              := TVirtualStringTree(sender) ;
   selected_node               := treeView_under.GetNodeAt( MousePos.X, MousePos.Y ) ;
   current_popup_selected_node := selected_node;

   globalMousePos := MousePos;

   if Assigned( selected_node ) then
   begin
     treeView_under.FocusedNode := selected_node;
     treeView_under.SetFocus;
     treeView_under.Selected[ selected_node ] := true;

     data := treeView_under.GetNodeData( selected_node ) ;
     if assigned( data ) then
     begin

     end;
           //СПРАВОЧНИК---------------------------------------------------------------
           if ( data.node_type = reference_type ) or ( data.node_type = document_type ) then
           begin
              Popup_SetContext( 'ref' );
              popup_info_caption.Caption     := 'Характеристики справочника';
              reference_or_document          := TPointerDIRReference( Data.object_pointer );
              //тип - справочник
              popup_info_object_type.Caption := 'Тип: Справочник';
              popup_info_ref_title.Caption   := 'Заголовок: ' + reference_or_document.name;
              popup_info_ref_name.Caption    := 'Имя: '       + reference_or_document.code;
              popup_info_ref_id.Caption      := 'ИД: ' + IntToStr(reference_or_document.vid);

           end;

           //РАЗДЕЛ-------------------------------------------------------------------
           if Data.node_type = section_type then
           begin
              Popup_SetContext( 'section' );
              section := TPointerDIRSection( Data.object_pointer );

              //тип - секция
              if section.is_table     then popup_info_object_type.Caption := 'Тип: Табличная часть';
              if not section.is_table then popup_info_object_type.Caption := 'Тип: Карточка';
           end;

           //РЕКВИЗИТ-----------------------------------------------------------------
           if ( data.node_type = reference_requisite_type  ) or ( data.node_type = document_requisite_type ) then
           begin
              Popup_SetContext( 'req' );
              popup_info_caption.Caption := 'Характеристики реквизита';
              requisite                  := TPointerDIRReferenceRequisite( Data.object_pointer );

              //тип - тип реквизита
              popup_info_object_type.Caption           := 'Тип: '          + requisite.the_requisite.his_type;
              popup_info_req_referencetype.Caption     := 'Тип спр.: '     + requisite.owner_object.code;
              popup_info_req_type.Caption              := 'Тип рекв.: '    + requisite.the_requisite.typeStr;
              popup_info_req_name.Caption              := 'Имя: '          + requisite.code;
              popup_info_req_field_name.Caption        := 'Имя поля: '     + requisite.the_requisite.fieldname;
              popup_info_req_title.Caption             := 'Заголовок: '    + requisite.name;
              popup_info_req_section.Caption           := 'Раздел: '       + TPointerDirSection(requisite.owner_section).name;
              popup_info_req_stored.Caption            := 'Сохранять: '    + BoolToYesString( requisite.the_requisite.stored );
              popup_info_req_required.Caption          := 'Обязательный: ' + BoolToYesString( requisite.the_requisite.required );
              popup_info_req_if_reference_type.Visible := requisite.the_requisite.isReference;
              popup_info_req_if_reference_type.Caption := 'Спр. тип: ' + requisite.the_requisite.reftypeString;

               // Для реквизитов с типом Признак----------------------
               popup_info_req_pick_values.Visible :=  ( requisite.the_requisite.typeStr = 'Признак' );
               if  requisite.the_requisite.typeStr = 'Признак' then
               begin
                  pickValuesString := requisite.the_requisite.priznValue;
//                  popup_info_req_pick_values.Caption := pickValuesString;
                  for i := 1 to 9 do
                  begin
                    menuItem         := DIRAssistant.FindComponent( 'popup_info_req_pick_value' + IntToStr(i) ) as TMenuItem;
                    menuItem.Visible := false;
                  end;
                  for i := 1 to SubStringCount( pickValuesString, ';') do
                  begin
                    pickVal          := SubString( pickValuesString, ';', i );
                    menuItem         := DIRAssistant.FindComponent( 'popup_info_req_pick_value' + IntToStr(i) ) as TMenuItem;
                    menuItem.Caption := pickVal;
                    menuItem.Visible := true;
                  end;
              end;


               // Для реквизитов на форме----------------------
               popup_info_req_show_on_form.Visible := requisite.on_form;
               if  requisite.on_form then
               begin
                  for i := 1 to 15 do
                  begin
                    menuItem         := DIRAssistant.FindComponent( 'popup_info_req_view' + IntToStr(i) ) as TMenuItem;
                    menuItem.Visible := false;
                  end;
                  for i := 0 to requisite.viewsOn.Count - 1 do
                  begin
                    try
                    pickVal          := requisite.viewsOn.Strings[i];
                    menuItem         := DIRAssistant.FindComponent( 'popup_info_req_view' + IntToStr(i+1) ) as TMenuItem;
                    menuItem.Caption := pickVal;
                    menuItem.Visible := true;
                    except
                      ON E:Exception  do
                      begin
                        DebugMessage( e.Message + #13 + 'Счетчик: ' + IntToStr(i) );
                      end;
                    end;
                  end;
              end;
            //-------------------------------------
           end;

           //Представление-------------------------------------------------------------------
           if Data.node_type = view_type then
           begin
              Popup_SetContext( 'view' );
           end;

           //Папка
           if Data.node_type = folder_type then
           begin
              Popup_SetContext( 'folder' );
           end;
           
      end
   else
   begin
   //нет узлов под курсором, не показывать всплывающее меню
    // Handled := true;
   end;
end;

procedure TDIRAssistant.VirtualStringTreeDblClick(Sender: TObject);
var
  ref_code,
  ref_table_name,
  req_code,
  req_field_name,
  section_code,
  section_table_name   : string;
  section_preproc_name : string;
  paste_string         : string;
  section_index        : integer;
  section_is_table     : boolean;
  selected_requisite   : TPointerDIRReferenceRequisite;
  selected_reference   : TPointerDIRReference;
  selected_section     : TPointerDIRSection;
  selected_node        : PVirtualNode;
  data: PVSTRecord;

begin
  paste_string      := '';
  section_is_table  := false;
  section_code      := '';
  section_index     := 0;
  selected_node     := VirtualStringTree.FocusedNode;
  if not Assigned( selected_node ) then exit;

    data := VirtualStringTree.GetNodeData( selected_node );
    if data.node_type in [document_type,reference_type, document_requisite_type, reference_requisite_type]   then
    begin

      TreeView_GetSelectedObjects( selected_reference, selected_section, selected_requisite );

      //Извлечь значения из полученных объектов-------------------------------------
      if Assigned( selected_requisite ) then
      begin
        req_code         := selected_requisite^.code;
        req_field_name   := selected_requisite^.the_requisite.fieldname;
      end;

      if Assigned( selected_reference ) then
      begin
        ref_code         := selected_reference.code;
        ref_table_name   := selected_reference.tablename;
      end;

      if Assigned( selected_section ) then
      begin
        section_code         := selected_section^.code;
        section_preproc_name := selected_section^.preproc_name;
        section_table_name   := selected_section^.tablename;
        section_is_table     := selected_section^.is_table;
      end;
      //----------------------------------------------------------------------------

      //СПРАВОЧНИК ИЛИ ДОКУМЕНТ-----------------------------------------------------
      if ( data.node_type = reference_type ) or ( data.node_type = document_type ) then
      begin
        if dock_assistant_options.preproc_mode_rbtn.Checked then
          paste_string := Format( '!%s!', [ref_code] );

        if dock_assistant_options.preproc_mode_short_rbtn.Checked then
          paste_string := Format( '!%s!', [ref_code] );
      
        if dock_assistant_options.name_mode_rbtn.Checked then
            paste_string := ref_code;

        if dock_assistant_options.bdfield_rbtn.Checked then
          paste_string := ref_table_name;

        if dock_assistant_options.full_bdfield_rbtn.Checked then
          paste_string := ref_table_name;
      end;
      //----------------------------------------------------------------------------

      //СЕКЦИЯ----------------------------------------------------------------------
        if Data.node_type = section_type then
        begin
           if dock_assistant_options.preproc_mode_rbtn.Checked then
             if section_is_table = true then
               paste_string := Format( '!%s.%s!',[ref_code,section_preproc_name] );
           if dock_assistant_options.bdfield_rbtn.Checked then
              paste_string := section_table_name;
        end;
      //----------------------------------------------------------------------------

      //РЕКВИЗИТ--------------------------------------------------------------------
            if ( data.node_type = reference_requisite_type  ) or ( data.node_type = document_requisite_type ) then
        begin

          //Режимы вставки----------------------------------------------------------
          if dock_assistant_options.preproc_mode_rbtn.Checked then
          begin
            if section_is_table = true then
              paste_string := Format( '!%s.%s!.!%s.%s.%s!', [ref_code,section_preproc_name,ref_code,section_preproc_name,req_code] )
            else                                                                       
              paste_string := Format( '!%s!.!%s.%s!', [ref_code, ref_code, req_code] );
          end;

          if dock_assistant_options.preproc_mode_short_rbtn.Checked then
          begin
            if section_is_table = true then
              paste_string := Format( '!%s.%s.%s!', [ref_code,section_preproc_name,req_code] )
            else
              paste_string := Format( '!%s.%s!', [ref_code, req_code] );
          end;

          if dock_assistant_options.name_mode_rbtn.Checked then
            paste_string := req_code;

          if dock_assistant_options.bdfield_rbtn.Checked then
            paste_string := req_field_name;

          if dock_assistant_options.full_bdfield_rbtn.Checked then
            paste_string := ref_table_name + '.' + req_field_name;
          //------------------------------------------------------------------------

        end;
      //----------------------------------------------------------------------------

        PostThroughLayout( paste_string );
    end;
end;

procedure TDIRAssistant.mark_show_referenceClick(Sender: TObject);
begin
  references.ApplyVirtualVisibility( VirtualStringTree );
  VirtualStringTree.Repaint;
end;

procedure TDIRAssistant.mark_show_documentClick(Sender: TObject);
begin
  references.ApplyVirtualVisibility( VirtualStringTree );
  VirtualStringTree.Repaint;
end;

procedure TDIRAssistant.N33Click(Sender: TObject);
begin
  ShellExecute( Application.Handle, PWideChar('open'), PWideChar(work_dir), nil, PWideChar(work_dir), SW_SHOW );
end;

procedure TDIRAssistant.MSIGUID1Click(Sender: TObject);
begin
  msi_form.Show;
end;

procedure TDIRAssistant.VirtualStringTreeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  DropdownLowBar();
end;

procedure TDIRAssistant.directum3Click(Sender: TObject);
begin
  query_form.isb_object.Lines.SaveToFile( work_dir + '\object.isb' );
  ShellExecute( Application.Handle, 'open', PWideChar( work_dir + '\object.isb' ), nil, PWideChar( work_dir ), SW_SHOW );
end;

procedure TDIRAssistant.N35Click(Sender: TObject);
var
  parent_handle : THandle;
  parent_window_title:array [ 0..255 ] of Char;
  title:string;
begin
  debug_window.Visible := true;
  debug_window.Show;
end;

procedure TDIRAssistant.N36Click(Sender: TObject);
begin
  metadataGetOnlyList     := false;
  debug_object_grab_limit := 5;
  toolbar_refresh_metadata.Click;
end;

procedure TDIRAssistant.N37Click(Sender: TObject);
begin
  metadataGetOnlyList := false;
  toolbar_refresh_metadata.Click;
end;

procedure TDIRAssistant.N39Click(Sender: TObject);
begin
//  isbl_debugger.Visible := true;
//  isbl_debugger.BringToFront;
end;

procedure TDIRAssistant.mniInvalidateNode1Click(Sender: TObject);
var
  node:PVirtualNode;
begin
  node := VirtualStringTree.FocusedNode;
  if Assigned( node ) then
  begin
    VirtualStringTree.InvalidateNode( node );
  end;
end;
          
procedure TDIRAssistant.popup_info_ref_idClick(Sender: TObject);
begin
  copyMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_ref_nameClick(Sender: TObject);
begin
  copyMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_ref_titleClick(Sender: TObject);
begin
  copyMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_field_nameClick(Sender: TObject);
begin
  copyMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_nameClick(Sender: TObject);
begin
  copyMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_referencetypeClick(Sender: TObject);
begin
  copyMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_sectionClick(Sender: TObject);
begin
   copyMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_titleClick(Sender: TObject);
begin
  copyMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_viewClick(Sender: TObject);
var
  node : PVirtualNode;
  data : PVSTRecord;
begin
  node  := VirtualStringTree.FocusedNode;
  if Assigned( node ) then
  begin
    //Собираем данные. после установки фильтра ноды умрут вместе с Data
    data := VirtualStringTree.GetNodeData( node );
    if Assigned( data ) then
    begin
     if data.node_type = view_type then
     begin
       TPointerDIRView(data.object_pointer).ShowForm();
       //TPointerDIRView(data.object_pointer).form_reference.Repaint;
     end;
    end;
  end;
end;

procedure TDIRAssistant.dfm1Click(Sender: TObject);
var
  node : PVirtualNode;
  data : PVSTRecord;
begin
  node  := VirtualStringTree.FocusedNode;
  if Assigned( node ) then
  begin
    //Собираем данные. после установки фильтра ноды умрут вместе с Data
    data := VirtualStringTree.GetNodeData( node );
    if Assigned( data ) then
    begin
     if data.node_type = view_type then
     begin
      EditText_SetDFMHightlighter();
      EditText( TPointerDIRView( data.object_pointer).dfm_text.Text );
     end;
    end;
  end;
end;

procedure TDIRAssistant.mark_onformClick(Sender: TObject);
begin
  VirtualStringTree.Repaint;
end;

procedure TDIRAssistant.N29Click(Sender: TObject);
begin
  ShowDebug();
end;

procedure TDIRAssistant.menuitemLoadByListClick(Sender: TObject);
begin
  metadataGetOnlyList := true;
  toolbar_refresh_metadata.Click;
end;

procedure TDIRAssistant.metadata_get_popupPopup(Sender: TObject);
begin
  PrepareMetaDataList();
end;

procedure TDIRAssistant.N30Click(Sender: TObject);
begin
  isblEditorForm.Show();
end;

procedure TDIRAssistant.popup_info_req_pick_value1Click(Sender: TObject);
begin
//  copyMenuCaptionValueToBuffer(Sender, '=', 1);
  copyWholeMenuCaptionValueToBuffer(sender);
end;

procedure TDIRAssistant.popup_info_req_pick_value2Click(Sender: TObject);
begin
  copyWholeMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_pick_value3Click(Sender: TObject);
begin
  copyWholeMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_pick_value4Click(Sender: TObject);
begin
  copyWholeMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_pick_value5Click(Sender: TObject);
begin
  copyWholeMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_pick_value6Click(Sender: TObject);
begin
  copyWholeMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_pick_value7Click(Sender: TObject);
begin
  copyWholeMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_pick_value8Click(Sender: TObject);
begin
  copyWholeMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_pick_value9Click(Sender: TObject);
begin
  copyWholeMenuCaptionValueToBuffer(Sender);
end;

procedure TDIRAssistant.popup_info_req_view10Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view11Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view12Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view13Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view14Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view15Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view1Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view2Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view3Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view4Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view5Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view6Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view7Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.popup_info_req_view9Click(Sender: TObject);
begin
    showRequisiteOnForm(Sender);
end;

procedure TDIRAssistant.PrepareMetaDataList;
var
  metadataListFileName: string;
begin
  if assigned( metadataGetList ) then
    metadataGetList.Free;
  metadataGetList      := TStringList.Create;
  metadataListFileName := work_dir + '\' + 'metalist.txt';
  if FileExists(metadataListFileName) then
    metadataGetList.LoadFromFile( metadataListFileName );
  menuitemLoadByList.Visible := metadataGetList.Count > 0;
end;

procedure TDIRAssistant.PreserveQuickFilter;
var
  filter_info: PQuickFilterInfo;
begin
  if currentQuickFilter <> -1 then
  begin
      filter_info                    := quick_filter_list.Items[ currentQuickFilter ];
      filter_info.name               := filter_ed.Text;
      filter_info.sub_name           := edit_filter_requisite_name.Text;
      filter_info.mark_references    := mark_show_reference.Down;
      filter_info.mark_edocs         := mark_show_document.Down;
      currentQuickToolButton.Caption := filter_info.name;
      currentQuickToolButton.Down    := False;
  end;
end;

procedure TDIRAssistant.ShowRequisiteOnForm(Sender: TObject);
var
  selected_node: PVirtualNode;
  requisite    : TPointerDIRReferenceRequisite;
  data         : PVSTRecord;
  formName     : string;
  i            : Integer;
  menuCaption  : string;
  viewAvailable: string;
  viewObject   : TObject;
begin
  menuCaption := (Sender as TMenuItem).Caption;
  menuCaption := replace( menuCaption, '&', '' );
  selected_node   := VirtualStringTree.GetNodeAt( GlobalMousePos.X, GlobalMousePos.Y ) ;
  if Assigned( selected_node ) then
  begin
    data := VirtualStringTree.GetNodeData( selected_node ) ;
  //РЕКВИЗИТ-----------------------------------------------------------------
    if ( data.node_type = reference_requisite_type  ) or ( data.node_type = document_requisite_type ) then
    begin
       requisite := TPointerDIRReferenceRequisite( Data.object_pointer );
       for i := 0 to requisite.viewsOn.Count -1  do
       begin
         viewAvailable := requisite.viewsOn.Strings[i];
         if viewAvailable = menuCaption then
          begin
            viewObject := requisite.viewsOn.Objects[i];
//
            formName   := (viewObject as TDirView).Name;
            TDIRView(viewObject).ShowForm();
            TDIRView(viewObject).HightlightControl( requisite.code );

          end;
       end;
    end;
  end;
end;

procedure TDIRAssistant.StringGrid1SelectCell(Sender: TObject; ACol, ARow:
    Integer; var CanSelect: Boolean);
begin
  Clipboard.AsText := (Sender as TStringGrid).Cells[ACol, ARow];
end;

procedure TDIRAssistant.ToolButton1Click(Sender: TObject);
begin

    if db_connection.Connected then
    begin
       Application.Title    := application_name + ' {' + connection_options_form.db_edit.Text + '}';
       DIRAssistant.Caption := Application.Title;
       DIRAssistant.FeelRouteNamesCombobox;
       DIRAssistant.InitMetadata();
    end;

    if not db_connection.Connected then
    begin
      connection_options_form.ShowModal;
      if db_connection.Connected then
      begin
        Application.Title    := application_name + ' {' + connection_options_form.db_edit.Text + '}';
        DIRAssistant.Caption := Application.Title;
        DIRAssistant.FeelRouteNamesCombobox;
        DIRAssistant.InitMetadata();
      end;
    end;
end;

end.


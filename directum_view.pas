unit directum_view;

interface

  uses classes, Menus, routine_directum_specific, SysUtils, directum_metadata, routine_strings, Dialogs, Controls, Forms, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Grids, Graphics, VirtualTrees,ShellApi, Windows, Clipbrd;

//Представление-------------------------------------------------------------------------

type
  TStringGricCellSelectProc = procedure(Sender: TObject; ACol, ARow:
    Integer; var CanSelect: Boolean);

type TViewControlParam = class(TObject)
  name:string;
  value:string;
end;

type TControlParams = class( TList )
  constructor Create();
  //члены
  public
    //методы
    function GetNameValue(index:integer):string;
    function GetValueAsInteger( name:string ):integer;
    function GetValueAsString( name:string ):string;
    function IndexByName( name:string ):integer;
    procedure AddParam( name,value:string );
    function GetParamCount():integer;
end;

//Элемент формы представления
type
  TViewFormControl = class(TObject)
    parent        : ^TViewFormControl;
    ref_requisite : TPointerDIRReferenceRequisite;
    params        : TControlParams;
    name          : string;
    control_type  : string;
    required      : boolean;
    index         : Integer;
    tag           : integer;
    controls_count: integer;
    controls      : array of ^TViewFormControl;
    metadata_type : TMetadataObjectType;

    protected
//      function GetParamCount():integer;

    public
      //служебное
      constructor Create();
      //свойства
//      property param_count: integer read GetParamCount;

end;

//Элемент формы представления
type
  PViewFormDescription = ^TViewFormDescription;
  TViewFormDescription = class( TViewFormControl )
    Reference      : TPointerDIRReference;
    TextHeight     : integer;
end;

//реквизит из справочника реквизитов
type
  TPointerDirView = ^TDIRView;
  TDIRView = class(TObject)
    view_form       : TViewFormDescription;
    name            : string;
    code            : string;
    form_reference  : pointer;
    viewForm        : TForm;
    dfm_text        : TStringList;
    main            : boolean;
    TagCount        : integer;
    comment         : string;
    dir_reference   : TPointerDIRReference;
    requisites_list : TList;
    actions_list    : TList;
  private
    function ExplainType(control:TViewFormControl): string;
    function RecursiveFindControlTag(view_form:TViewFormDescription;
        control:TViewFormControl; searchCode:string): integer;
  public
    constructor Create();
    procedure HightlightControl(requisiteCode : string);
    procedure ParseDFMTextView();
    function RecursiveDrawForm(view_form:TViewFormDescription;
        control:TViewFormControl; parent:TWinControl; theForm:TForm): TForm;
    procedure ShowForm();
    procedure ShowYourCaption(Sender:TObject);
    procedure RecursiveDrawStructure( parent_node:PVirtualNode; control:TViewFormControl; treeview: TVirtualStringTree );


end;

type
    TEventHandlers = class // create a dummy class
       procedure StringGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);

    end;



//------------------------------------------------------------------------------

var EvHandler:TEventHandlers;

implementation

uses unit1, routine_debug, requisites_list, virtual_tree_routine, main;

procedure TEventHandlers.StringGridSelectCell(Sender: TObject; ACol, ARow: Integer; var
    CanSelect: Boolean);
var
  cellvalue: string;
begin
  cellvalue := (Sender as TStringGrid).Cells[ACol, ARow];
  Clipboard.AsText := cellvalue;
  window.TrayIcon.BalloonHint('Значение скопировано в буфер', cellvalue );
end;

constructor TViewFormControl.Create();
begin
  Inherited Create;
  params := TControlParams.Create;
  controls_count := 0;
end;

constructor TControlParams.Create();
begin
  Inherited Create;

end;

procedure TControlParams.AddParam( name, value:string );
var
  param : TViewControlParam;
begin
  param        := TViewControlParam.Create;
  param.name   := name;
  param.value  := value;
  Add( param );
end;

function TControlParams.GetNameValue( index:integer ):string;
begin
  result := TViewControlParam( Items[ index ] ).name + '=' + TViewControlParam( Items[ index ] ).value;
end;

function TControlParams.IndexByName( name:string ):integer;
var
  i:integer;
begin
  result := -1;
  for i:= 0 to Count - 1 do
  begin
    if LowerCase( TViewControlParam( Items[ i ] ).name ) = LowerCase( name )
     then result := i;
  end;
end;

function TControlParams.GetParamCount():integer;
begin
 result := Count;
end;

function TControlParams.GetValueAsString( name:string ):string;
var
  index:integer;
begin
  result := '';
  index := IndexByName( name );
  if index <> -1 then
  result := TViewControlParam( Items[ index ] ).value;
end;

function TControlParams.GetValueAsInteger( name:string ):integer;
var
  index:integer;
begin
  result := 0;
  index := IndexByName( name );
  if index <> -1 then
  result := StrToInt( TViewControlParam( Items[ index ] ).value );
end;

constructor TDirView.Create;
begin
  inherited Create;
  dfm_text        := TStringList.Create;
  view_form       := TViewFormDescription.Create;
  requisites_list := TList.Create;
  actions_list    := TList.Create;
  TagCount        := 0;
end;

function dfm_extract_control_name( str:string ):string;
var
  control_name:string;
begin
   control_name  := SubString( str, ' ',   2 );
   control_name  := Replace( control_name, ':',   '' );
   control_name  := Replace( control_name, '''',  '' );
   Result := control_name;
end;



function dfm_extract_control_index( str:string ):string;
var
  controlIndex : string;
begin
  controlIndex := ExtractString( str, '[',']' );
  result       := controlIndex;
end;

function dfm_extract_param_value( str:string ):string;
var
  param_value:string;
begin
  param_value := Trim( SubString( str, '=', 2 ) );
  param_value := ConvertString( param_value );
  param_value := Replace( param_value, '''','' );
  param_value := Replace( param_value, '¦', '№' );
  Result := param_value;
end;

function MetaDataTypeByControlType( control_type_str:string ) : TMetadataObjectType;
begin
 Result := control_type;


 if ( control_type_str = 'TSLDBEdit' ) or
    ( control_type_str = 'TSLDBComboBox' ) or
    ( control_type_str = 'TSLDBMemo' ) or
    ( control_type_str = 'TSLcxGridDBColumn' ) or
    ( control_type_str = 'TSLDBEllipsis' ) or
    ( control_type_str = 'TSLDBCheckBox' )
    then
       result := requisite_type;

 if ( control_type_str = 'TSLButton' ) or
    ( control_type_str = 'TSLHyperLinkLabel' ) or
    ( control_type_str = 'TSLStandardAction' )
    then
       result := action_type;

end;

//Должен ли создавать узел и парсить подчиненных?
function ShouldCreateNodeWithControlAndParseChildren( control_type_str:string ):boolean;
begin
  result := true;
   if ( control_type_str = 'TDataSource' ) or
    ( control_type_str = 'TStatusBar' ) or
    ( control_type_str = 'TStatusBar' ) or
    ( control_type_str = 'TSLDBNavigator' ) or
    ( control_type_str = 'TSLDBStatusLabel' ) or
    ( control_type_str = 'TcxGridLevel' ) or
    ( control_type_str = 'TSLNoControlExitAction' ) or
    ( control_type_str = 'TSLRecordAction' )
    then
       result := false;
end;

//Должен ли создавать узел для контрола? Парсинг детей будет выполнен в любом случае.
function ShouldCreateNodeForControl_ParseChildrenAnyWay( control_type:string ):Boolean;
begin
  result := true;
  if ( control_type = 'TSBForm' ) or
     ( control_type = 'TSBLifeTimeTemplateForm' ) then
  begin
    result := false;
  end;
end;

function TDIRView.ExplainType(control:TViewFormControl): string;
var
  controlRequisite: TPointerDIRRequisite;
  isReference     : boolean;
  typeExplained   : string;
begin
  typeExplained := '';
  controlRequisite := control.ref_requisite.the_requisite;
  isReference      := controlRequisite.isReference;
  if isReference then
  begin
    typeExplained := typeExplained + ' {' + controlRequisite.reftypeString + '}';
  end;
  typeExplained := typeExplained + ' [' + controlRequisite.typeStr + ']';

  Result := typeExplained; // TODO:
end;

function TDIRView.RecursiveFindControlTag(view_form:TViewFormDescription;
    control:TViewFormControl; searchCode:string): integer;
var
  i: Integer;
  nextTag: integer;
begin

  result := -1;
  if Assigned( control.ref_requisite ) then
    if control.ref_requisite.code = searchCode then
      result := control.tag;

  if result = -1 then
    for  i:= 0 to control.controls_count -1 do
    begin
      nextTag := RecursiveFindControlTag( view_form, control.controls[i]^, searchCode );
      if nextTag <> -1 then
        result := nextTag;
    end;

end;

procedure TDIRView.HightlightControl( requisiteCode : string );
var
  component         : TComponent;
  componentsCount   : integer;
  i                 : integer;
  caption           : string;
  tag               : integer;
  backColor         : TColor;
  labelColor         : TColor;
begin
  backColor  := clSkyBlue;
  labelColor := clBlue;

   tag             := RecursiveFindControlTag( view_form, view_form, requisiteCode );
   caption         := self.viewForm.Caption;
   componentsCount := self.viewForm.ComponentCount - 1;
   for i:=0 to componentsCount do
   begin
    component := viewForm.Components[i];
    if component.Tag = tag then
    begin

        if component IS TEdit then
          (component as Tedit).Color := BackColor;

        // надпись
        if component IS TLabeledEdit then
        begin
          (component as TLabeledEdit).Color                := BackColor;
          (component as TLabeledEdit).EditLabel.Font.Color := labelColor;
          (component as TLabeledEdit).EditLabel.Font.Style := [fsBold];
        end;

        if component IS TLabel then
        begin
          (component as TLabel).Font.Color := labelColor;
          (component as TLabel).Font.Style := [fsBold];
        end;

        if component IS TCheckBox then
        begin
          (component as TCheckBox).Color      := BackColor;
          (component as TCheckBox).Font.Color := labelColor;
          (component as TCheckBox).Font.Style := [fsBold];
        end;

        if component IS TMemo then
        begin
          (component as TMemo).Color := BackColor;
        end;

    end;

   end;

end;

procedure TDIRView.RecursiveDrawStructure( parent_node:PVirtualNode; control:TViewFormControl; treeview: TVirtualStringTree );
var
  control_node : PVirtualNode;
  node_data    : PVSTRecord;
  i : integer;
begin
  if ShouldCreateNodeWithControlAndParseChildren( control.control_type ) then
  begin

    if ShouldCreateNodeForControl_ParseChildrenAnyWay( control.control_type ) then
    begin
      control_node             := treeview.AddChild( parent_node );
      node_data                := treeview.GetNodeData( control_node );
      node_data.object_pointer := control;
      node_data.node_type      := control_type;
    end
    else
      control_node := parent_node;

    for i:=0 to control.controls_count - 1 do
       RecursiveDrawStructure( control_node, control.controls[i]^, treeview );

  end

end;

procedure TDIRView.ParseDFMTextView();
var
  view_form_control : ^TViewFormControl;
  action_list       : ^TViewFormControl;
  cur_parrent       : ^TViewFormControl;

  dir_ref_requisite : TPointerDIRReferenceRequisite;
  that_requisite    : TPointerDIRRequisite;

  i                 : integer;
  cur_string        : string;
  controls_count    : Integer;

  control_name,
  control_type,
  control_index     : string;

  object_params     : TStringList;
  form_params       : TStringList;
  foundView: Boolean;
  i_view: Integer;

  param_name  : string;
  param_value : string;
  viewString: string;

//  form_node : TTreeNode;
//  control_node : TTreeNode;
begin
  controls_count := 0;
  form_params    := TStringList.Create;
  object_params  := TStringList.Create;

  try
    for i:=0 to dfm_text.Count - 1 do
    begin
      cur_string := dfm_text.Strings[ i ];
      cur_string := Trim( cur_string );

      //ФОРМА. Объявление формы----------------------------------------------------------
      if Pos(  'inherited', ' ' + cur_string ) > 0 then
      begin
         //object StatusBar1: TStatusBar [0]
         control_name   := dfm_extract_control_name( cur_string );
         control_type   := SubString( cur_string, ' ', 3 );
         if ( control_type = 'TSBForm' ) or ( control_type = 'TSBLifeTimeTemplateForm' ) then
         begin
           view_form.name         := control_name;
           view_form.control_type := control_type;
           view_form.parent       := @view_form;
           view_form_control      := @view_form;
           continue;
         end;
      end;

      //КОНТРОЛ. Объявление нового контрола на форме---------------------------------------
      if ( FindSubString(  cur_string, ' object ') ) or
         ( FindSubString(  cur_string, 'inherited' ) ) then
      begin

        //Выглядит это так: object OurFirmStatusLabel: TSLDBStatusLabel [2]
        cur_parrent := @view_form_control^;
        //создать и привязать компонент к форме-----------------------------------
        try
          New( view_form_control );
          view_form_control^        := TViewFormControl.Create;
          view_form_control^.tag    := Self.TagCount;
          Inc( Self.TagCount );
          view_form_control^.parent := @cur_parrent^;

//          if FindSubString( cur_string, 'object TSLDBNavigator [2]' )  then
//          begin
//               sleep(1);
//          end;

          // для строк вида
          // object StatusBar1: TStatusBar [3]
          if findSubString( cur_string, ':' ) then
          begin
            control_name  := dfm_extract_control_name( cur_string );
            control_type  := SubString( cur_string, ' ', 3 );
            control_index := dfm_extract_control_index( cur_string );
          end;

          // для строк вида
          // object TSLDBNavigator [2]
          if not findSubString( cur_string, ':' ) then
          begin
            control_name  := dfm_extract_control_name( cur_string );
            control_type  := control_name;
            control_index := dfm_extract_control_index( cur_string );
          end;


          if not StringAssigned( control_index ) then
            control_index := '-1';

          if not StringAssigned( control_type ) then
            control_type := control_name;

          view_form_control^.control_type  := control_type;
          view_form_control^.name          := control_name;
          view_form_control^.index         := StrToInt( control_index );
          view_form_control^.metadata_type := MetaDataTypeByControlType( control_type );
        except

          ShowMessage('Возникла ошибка при обработке представления. ' + #13 +
                      'Возникла ошибка при обработке объявления нового контрола: ' + control_name );
          EditText( dfm_text.Text );
        end;

        //Прицепить данный контрол к родителю-------------------------------------
        try
          controls_count  := view_form_control.parent.controls_count + 1;
          SetLength( view_form_control^.parent.controls, controls_count );
          view_form_control^.parent.controls[ controls_count - 1] := Addr( view_form_control^ );
          view_form_control^.parent.controls_count := controls_count;
        except
          dfm_text.SaveToFile( work_dir + '\debug\' + 'dfm.txt' );
          DebugMessage(' Ошибка при обработке описания представления. Текст описания сохранен в каталог программы. ');
          DebugMessage( 'Описание: имя контрола: ' + control_name + ' строка: ' + IntToStr(i) );
          ShowDebug();
          exit;
        end;
        //------------------------------------------------------------------------
      end;

      if ( Pos(  ' end', ' ' + cur_string ) > 0 ) and ( Pos(  'end>', ' ' + cur_string ) = 0 ) then
      begin
        view_form_control := @view_form_control.parent^;
        cur_parrent       := @view_form_control^.parent^ ;
      end;

      //ПАРАМЕТРЫ КОНТРОЛА. Получить значения параметров--------------------------
      if Pos( '=', cur_string ) > 0 then
      begin
        param_value := '';
        param_name  := Trim( SubString( cur_string, '=', 1 ) );
        param_value := dfm_extract_param_value( cur_string );
        if assigned( view_form_control ) then
        begin
          try
            //добавить параметр в список
            view_form_control^.params.AddParam( param_name, param_value );

            //доп. обработка----------------------------------------------------
            //Если параметр это RequisiteCode, тогда нужно контрол связать с реквизитов
            try
              if ( param_name = 'RequisiteCode' ) then
              if view_form_control^.metadata_type = requisite_type then
              begin
               //если это обычный реквизит у которого есть привязка к реквизиту справочника
                dir_ref_requisite := TRefRequisitesList( dir_reference^.requisites ).GetRequisiteByCode( param_value );
                if Assigned( dir_ref_requisite ) then
                begin
                  dir_ref_requisite.on_form       := true;

                  // добавить новое Вью если еще не было добавлено
                  // проверка нужна так как один реквизит может быть использован во Вью много раз.
                  // сделать экстракт метода
                  viewString := name + ':' + code;
                  foundView  := false;
                  for i_view := 0 to dir_ref_requisite.viewsOn.Count - 1 do
                    if viewString = dir_ref_requisite.viewsOn.Strings[i_view] then
                      foundView := true;
                  if not foundView then
                    dir_ref_requisite.viewsOn.AddObject( viewString, Self );

                  view_form_control.ref_requisite := @dir_ref_requisite^;
                  view_form_control.required      := dir_ref_requisite.required;
                  requisites_list.Add( dir_ref_requisite );
                end;

                //Если это реквизит Номер строки табличной части, тогда
                if ( not Assigned( dir_ref_requisite ) ) and ( param_value = 'НомСтр' ) then
                begin
                  New( dir_ref_requisite );
                  dir_ref_requisite.name          := 'НомСтр';
                  dir_ref_requisite.code          := 'НомСтр';
                  dir_ref_requisite.on_form       := True;
                  dir_ref_requisite.readonly      := true;
                  dir_ref_requisite.filter        := false;
                  dir_ref_requisite.sources       := false;
                  dir_ref_requisite.leader        := false;
                  dir_ref_requisite.the_requisite := nil;
                  dir_ref_requisite.required      := false;
                  view_form_control.ref_requisite := @dir_ref_requisite^;
                  new( that_requisite );
                  that_requisite.code             := 'НомСтр';
                  that_requisite.name             := 'НомСтр';
                  that_requisite.fieldname        := 'НомСтр'; //некорректно
                  dir_ref_requisite.the_requisite :=  @that_requisite^;
                  requisites_list.Add( dir_ref_requisite );
                end;

              end;
            except
              ShowMessage('Возникла ошибка при попытке привязать контрол к реквизиту.');
              exit();
            end;
            //------------------------------------------------------------------

            try
              //Действия тоже нужно связывать с реквизитами-----------------------
              if view_form_control^.metadata_type = action_type then
              begin
                if ( ( param_name = 'Code' ) and ( view_form_control^.control_type = 'TSLStandardAction' ) ) or
                   ( ( param_name = 'RequisiteCode' ) and ( view_form_control^.control_type = 'TSLButton' ) )
                then
                begin
                  dir_ref_requisite := TRefRequisitesList( dir_reference^.requisites ).GetRequisiteByCode( param_value );
                  if Assigned( dir_ref_requisite ) then
                  begin
                    view_form_control.ref_requisite := @dir_ref_requisite^;
                    requisites_list.Add( dir_ref_requisite );
                  end;
                end;
              end;
              //------------------------------------------------------------------
            except
              ShowMessage('Возникла ошибка при попытке привязать действие к реквизиту.');
              exit();
            end;

            //------------------------------------------------------------------
          except
            ShowMessage('Возникла ошибка при обработке представления. Ошибка при получении значения свойства контрола.');
            exit();
          end;

        end
          else
            ShowMessage( 'Параметр есть а контрола нет' );
      end;
      //------------------------------------------------------------------------

    end;

  except
    ShowMessage('Возникла общая ошибка при обработке DFM представления. Представление "' + name + '", справочник "' + dir_reference.name + '"' );
    EditText( dfm_text.Text );
    exit();
  end;


end;

function TDIRView.RecursiveDrawForm(view_form:TViewFormDescription;
    control:TViewFormControl; parent:TWinControl; theForm:TForm): TForm;
var
  i             : integer;
  handled       : boolean;
  label_spacing : integer;
  active_page   : string;
  this_component: TWinControl;
  form          : TForm;
  page_control  : TPageControl;
  tab_sheet     : TTabSheet;
  groupbox      : TGroupBox;
  button        : TButton;
  dbedit        : TEdit;
  memo          : TMemo;
  navigator       : TDBNavigator;
  editlabel       : TLabel;
  hyperlabel      : TLabel;
  grid            : TStringGrid;
  browser         : TPanel;
  image_panel     : TPanel;
  checkbox        : TCheckBox;
  controlRequisite: TPointerDIRRequisite;
  gridCellProc    : TStringGricCellSelectProc;
  gridPopup: TPopupMenu;
  isReference     : boolean;
  menuItem: TMenuItem;
  tempStr         : string;

begin
  handled := false;
  if ( control.control_type = 'TSBForm' ) or ( control.control_type = 'TSBLifeTimeTemplateForm' ) then
  begin
    form             := TForm.Create( DIRAssistant );
    form.Width       := view_form.params.GetValueAsInteger( 'ClientWidth' ) + 15;
    form.Height      := view_form.params.GetValueAsInteger( 'ClientHeight' ) + 15;

//    form.Width       := view_form.params.GetValueAsInteger( 'ExplicitWidth' ) + 15;
//    form.Height      := view_form.params.GetValueAsInteger( 'ExplicitHeight' ) + 15;

    form.BorderStyle := bsSizeable;
    form.Caption     := view_form.params.GetValueAsString( 'Caption' );
    this_component   := form;
    result           := form;
    form_reference   := Addr( form );
//    Self.form        := Addr( form );
    tempStr          := Self.viewForm.Caption;
    theForm := form;

    // Поверх всех окон
    SetWindowLong(form.handle, GWL_EXSTYLE, WS_EX_APPWINDOW);
    SetWindowLong(form.Handle, GWL_HWNDPARENT, GetDesktopWindow);
    SetWindowPos(form.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE   or SWP_NOSIZE);

//    form.Show;
    handled := true;
  end;


  // РЕКВИЗИТ поле
  if ( control.control_type = 'TSLDBEdit' )     or
     ( control.control_type = 'TSLDBEllipsis' ) or
     ( control.control_type = 'TSLDBComboBox' ) then
  begin
     dbedit         := TEdit.Create( theForm );
     dbedit.Left    := control.params.GetValueAsInteger('Left');
     dbedit.Tag     := control.Tag;
     dbedit.Top     := control.params.GetValueAsInteger('Top');
     dbedit.Width   := control.params.GetValueAsInteger('Width');
     dbedit.Height  := control.params.GetValueAsInteger('Height');
     dbedit.Text    := control.params.GetValueAsString('RequisiteCode');
     dbedit.Parent  := parent;
     dbedit.Text    := dbedit.Text + ExplainType( control );
     this_component := dbedit;

     //Создание подписи---------------------------------------------------------
     editlabel         := TLabel.Create( theForm );
     editlabel.Caption := control.params.GetValueAsString('EditLabel.Caption') + ':';



     editlabel.Tag     := control.Tag;
     if control.required then
      begin
        editlabel.Caption := '*' + editlabel.Caption;
        editLabel.Font.Style := [fsBold];
      end;
     editlabel.Parent  := parent;
     label_spacing     := control.params.GetValueAsInteger('LabelSpacing');
     if control.params.GetValueAsString( 'LabelPosition' ) <> 'lpAbove' then
     begin
       editlabel.Left    := this_component.Left - label_spacing;
       editlabel.Top     := this_component.Top + 2;
     end;
     if control.params.GetValueAsString( 'LabelPosition' ) = 'lpAbove' then
     begin
       editlabel.Left    := this_component.Left;
       editlabel.Top     := this_component.Top - label_spacing;
     end;
     editlabel.OnClick := ShowYourCaption;
     //-------------------------------------------------------------------------

     handled := true;
  end;

  // РЕКВИЗИТ поле ТЕКСТА
  if ( control.control_type = 'TSLDBMemo' ) then
  begin
     memo           := TMemo.Create( theForm );
     memo.Left      := control.params.GetValueAsInteger('Left');
     memo.Top       := control.params.GetValueAsInteger('Top');
     memo.Width     := control.params.GetValueAsInteger('Width');
     memo.Tag       := control.Tag;
     memo.Height    := control.params.GetValueAsInteger('Height');
     memo.Text      := control.params.GetValueAsString('RequisiteCode');
     memo.Parent    := parent;
     memo.Text      := memo.Text + ExplainType( control );
     this_component := memo;

     //Создание подписи---------------------------------------------------------
     editlabel         := TLabel.Create( theForm );
     editlabel.Caption := control.params.GetValueAsString('EditLabel.Caption') + ':';
     editlabel.Parent  := parent;
     editlabel.Tag     := control.Tag;
     label_spacing     := control.params.GetValueAsInteger('LabelSpacing');
     if control.params.GetValueAsString( 'LabelPosition' ) <> 'lpAbove' then
     begin
       editlabel.Left    := this_component.Left - label_spacing;
       editlabel.Top     := this_component.Top + 2;
     end;
     if control.params.GetValueAsString( 'LabelPosition' ) = 'lpAbove' then
     begin
       editlabel.Left    := this_component.Left;
       editlabel.Top     := this_component.Top - label_spacing;
     end;
     //-------------------------------------------------------------------------
      if control.required then
      begin
        editlabel.Caption := '*' + editlabel.Caption;
        editlabel.Font.Style := [fsBold];
      end;
     handled := true;
  end;

  // РЕКВИЗИТ признак Да/Нет
  if control.control_type = 'TSLDBCheckBox' then
  begin
    checkbox         := TCheckBox.Create( theForm );
    checkbox.Left    := control.params.GetValueAsInteger('left');
    checkbox.Top     := control.params.GetValueAsInteger('top');
    checkbox.Height  := control.params.GetValueAsInteger('Height');
    checkbox.Width   := control.params.GetValueAsInteger('Width');
    checkbox.Caption := control.params.GetValueAsString('Caption');
    checkbox.Parent  := parent;
    checkbox.Tag     := control.tag;
    checkbox.Caption := checkbox.Caption + ExplainType( control );

    if control.required then
    begin
        checkbox.Caption := '*' + checkbox.Caption;
        checkbox.Font.Style := [fsBold];
    end;

    this_component  := checkbox;
    handled         := true;
  end;

  // ДЕЙСТВИЕ ссылка
  if control.control_type = 'TSLHyperLinkLabel' then
  begin
    hyperlabel            := TLabel.Create( theForm );
    hyperlabel.Left       := control.params.GetValueAsInteger('left');
    hyperlabel.Top        := control.params.GetValueAsInteger('top');
    hyperlabel.Height     := control.params.GetValueAsInteger('Height');
    hyperlabel.Width      := control.params.GetValueAsInteger('Width');
    hyperlabel.Caption    := control.params.GetValueAsString('Caption');
    hyperlabel.Font.Style :=[fsUnderline];
    hyperlabel.Font.Color := clBlue;
    hyperlabel.Parent     := parent;
    hyperlabel.Tag        := control.tag;
    this_component        := parent;
    handled               := true;
  end;

  if control.control_type = 'TSLWebBrowserControl' then
  begin
    browser          := TPanel.Create( theForm );
    browser.Left     := control.params.GetValueAsInteger('left');
    browser.Top      := control.params.GetValueAsInteger('top');
    browser.Height   := control.params.GetValueAsInteger('Height');
    browser.Width    := control.params.GetValueAsInteger('Width');
    browser.Parent   := parent;
    browser.Caption  := 'Веб-браузер';
    browser.Tag      := control.tag;

    this_component   := browser;
   // Создание подписи---------------------------------------------------------
   editlabel         := TLabel.Create( theForm );
   editlabel.Caption := control.params.GetValueAsString('EditLabel.Caption') + ':';
   editlabel.Parent  := parent;
   editlabel.Tag     := control.tag;
   label_spacing     := control.params.GetValueAsInteger('LabelSpacing');
   if control.params.GetValueAsString( 'LabelPosition' ) <> 'lpAbove' then
   begin
     editlabel.Left    := this_component.Left - label_spacing;
     editlabel.Top     := this_component.Top + 2;
   end;
   if control.params.GetValueAsString( 'LabelPosition' ) = 'lpAbove' then
   begin
     editlabel.Left    := this_component.Left;
     editlabel.Top     := this_component.Top - label_spacing;
   end;
   //-------------------------------------------------------------------------

   handled := true;
  end;

  if control.control_type = 'TSLDBImageControl' then
  begin
    image_panel         := TPanel.Create( theForm );
    image_panel.Left    := control.params.GetValueAsInteger('left');
    image_panel.Top     := control.params.GetValueAsInteger('top');
    image_panel.Height  := control.params.GetValueAsInteger('Height');
    image_panel.Width   := control.params.GetValueAsInteger('Width');
    image_panel.Parent  := parent;
    image_panel.Tag     := control.tag;
    image_panel.Caption := 'Изображение';
    this_component      := image_panel;
   handled := true;
  end;

  if control.control_type = 'TSLPageControl' then
  begin
    page_control        := TPageControl.Create( theForm );
    page_control.Left   := control.params.GetValueAsInteger('left');
    page_control.Top    := control.params.GetValueAsInteger('top');
    page_control.Height := control.params.GetValueAsInteger('Height');
    page_control.Width  := control.params.GetValueAsInteger('Width');
    page_control.Parent := parent;
    page_control.Tag    := control.tag;
    this_component := page_control;
    handled := true;
  end;

  if control.control_type = 'TSLcxGrid' then
  begin
    grid                  := TStringGrid.Create( theForm );
    grid.Left             := control.params.GetValueAsInteger('left');
    grid.Top              := control.params.GetValueAsInteger('top');
    grid.Height           := control.params.GetValueAsInteger('Height');
    grid.Width            := control.params.GetValueAsInteger('Width');
    grid.OnSelectCell     := EvHandler.StringGridSelectCell;
    grid.Tag              := control.tag;
    grid.RowCount         := 2;
    grid.FixedRows        := 1;
    grid.FixedCols        := 0;
    grid.ColCount         := 0;
    grid.ColWidths[0]     := 0;
    grid.Ctl3D            := false;
    grid.BorderStyle      := bsSingle;
    grid.DefaultRowHeight := 15;
    grid.Parent           := parent;
    grid.Options          := [goColSizing, goVertLine, goHorzLine];
    this_component        := grid;
    handled               := true;
  end;

  if control.control_type = 'TSLcxGridDBTableView' then
  begin
    grid           := TStringGrid( parent );
    this_component := parent;
    handled        := true;
  end;

  // РЕКВИЗИТ в ТАБЛИЦЕ
  if control.control_type = 'TSLcxGridDBColumn' then
  begin
    grid           := TStringGrid( parent );
    this_component := parent;
    grid.ColCount  := grid.ColCount + 1;
    grid.Cells[ grid.ColCount -1, 0]   := control.params.GetValueAsString('Caption');
    grid.Cells[ grid.ColCount -1, 1]   := control.params.GetValueAsString('RequisiteCode');
    grid.ColWidths[ grid.ColCount -1 ] := control.params.GetValueAsInteger('Width');
    grid.Cells[ grid.ColCount -1, 1]   :=  grid.Cells[ grid.ColCount -1, 1] + ExplainType( control );
    handled        := true;
  end;
  
  try
    if control.control_type = 'TSLTabSheet' then
    begin
      tab_sheet             := TTabSheet.Create( theForm );
      tab_sheet.Caption     := control.params.GetValueAsString('Caption');
      tab_sheet.Parent      := parent;
      tab_sheet.Tag         := control.Tag;
      tab_sheet.PageControl := TPageControl( parent );
      tab_sheet.Visible     := true;
//      tab_sheet.Name        := control.name;
      this_component        := tab_sheet;

      handled := true;
    end;
  except
      ShowMessage( 'Ошибка при создании страницы PageControl' );
  end;

  if control.control_type = 'TSLGroupBox' then
  begin
     groupbox := TGroupBox.Create( theForm );
     groupbox.Left    := control.params.GetValueAsInteger('Left');
     groupbox.Top     := control.params.GetValueAsInteger('Top');
     groupbox.Width   := control.params.GetValueAsInteger('Width');
     groupbox.Tag     := control.Tag;
     groupbox.Height  := control.params.GetValueAsInteger('Height');
     groupbox.Caption := control.params.GetValueAsString('Caption');
     groupbox.Parent  := parent;

     this_component   := groupbox;
     handled          := true;
  end;

  // ДЕЙСТВИЯ кнопка
  if control.control_type = 'TSLButton' then
  begin
     button := TButton.Create( theForm );
     button.Left    := control.params.GetValueAsInteger('Left');
     button.Top     := control.params.GetValueAsInteger('Top');
     button.Width   := control.params.GetValueAsInteger('Width');
     button.Height  := control.params.GetValueAsInteger('Height');
     button.ShowHint := true;
     button.Hint    := control.params.GetValueAsString('RequisiteCode');
     button.Tag     := control.Tag;

     if Assigned( control.ref_requisite ) then
       button.Caption := control.ref_requisite.name
     else
       button.Caption := control.params.GetValueAsString('RequisiteCode');


     if control.params.GetValueAsString('Action') = 'AddAction' then
     begin
      button.Caption := 'Добавить';
      button.Hint := 'AddAction';
     end;
     if control.params.GetValueAsString('Action') = 'SaveRecordAction' then
     begin
      button.Caption := 'Сохранить';
      button.Hint := 'SaveRecordAction';
     end;
     if control.params.GetValueAsString('Action') = 'DeleteAction' then
     begin
      button.Caption := 'Удалить';
      button.Hint := 'DeleteAction';
     end;
     if control.params.GetValueAsString('Action') = 'CancelAction' then
     begin
      button.Caption := 'Отменить';
      button.Hint := 'CancelAction';
     end;
     if control.params.GetValueAsString('Action') = 'ExitAction' then
     begin
      button.Caption := 'Выход';
      button.Hint := 'ExitAction';
     end;

     button.ShowHint := True;
     button.Parent  := parent;
     this_component := button;
     handled        := true;
  end;


  if ( control.control_type = 'TSLDBNavigator' ) then
  begin
     navigator                := TDBNavigator.Create( theForm );
     navigator.VisibleButtons := [ nbFirst, nbPrior, nbNext, nbLast ];
     navigator.Left           := control.params.GetValueAsInteger('Left');
     navigator.Top            := control.params.GetValueAsInteger('Top');
     navigator.Width          := control.params.GetValueAsInteger('Width');
     navigator.Height         := control.params.GetValueAsInteger('Height');
     navigator.Parent         := parent;
     navigator.Tag            := control.Tag;

     this_component           := navigator;
     handled                  := true;
  end;

  if handled then
  for  i:= 0 to control.controls_count -1 do
    RecursiveDrawForm( view_form, control.controls[i]^, this_component, theForm );


  if control.control_type = 'TSLPageControl' then
  begin
      page_control.ActivePageIndex := 0;
      page_control.ActivePage.BringToFront;
  end;


end;

procedure TDIRView.ShowForm();
var
  name : string;
begin

  name := view_form.name;
  viewForm := RecursiveDrawForm( view_form, view_form, nil, nil );
  viewForm.Show();

end;

procedure TDIRView.ShowYourCaption(Sender:TObject);
begin
  ShowMessage( TLabel(Sender).Caption );
end;

end.

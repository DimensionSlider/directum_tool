unit reference_list;

interface

uses classes, SQLExpr, directum_metadata, routine_strings, SysUtils, routine_db, ComCtrls, Dialogs, VirtualTrees, section_list, DB, uni ;

//база реквизитов
type
  TReferenceList = class(TList)
  db_connection: ^TSqlConnection;

  requisite_filter : string;
  reference_filter : string;

  query : string;
  protected
   function IndexByName( name:string ):integer;
   function IndexByCode( code:string ):integer;   
   procedure ProcessRequisiteList();

  public
    constructor Create(); overload;
    constructor Create( db_connection:TSQLConnection ); overload;
    procedure SetConnection( db_connection: TSQLConnection );
    procedure SetDownloadQuery( query_text:string );
    procedure FetchMetadataDescription();
    procedure FeelVirtualTree( treeview:TVirtualStringTree );
    function RequisiteByCode( req_code:string ):TDIRRequisite;

    procedure SetRequisiteFilter( name_or_code:string );
    procedure SetReferenceFilter( name_or_code:string );
    procedure ApplyVirtualVisibility( treeview:TVirtualStringTree );

    /// Загружает описание справочников и документов.
    procedure GetObjectDescription(queryText:string);
    procedure GetObjectSections( dir_reference:TPointerDIRReference );
    procedure GetObjectViews( dir_reference:TPointerDIRReference );

    /// Получить описание реквизитов уже в конкретных справочниках
    procedure GetReferenceRequisiteDescription(dir_reference :
        TPointerDIRReference; dir_section:TPointerDIRSection);
end;

function GetCPUTick: int64;

implementation

uses Unit1, sql_comfort_form,  requisites_list, routine_debug, progress_bar_unit, directum_view, virtual_tree_routine;

function GetCPUTick: int64;
asm
  db 0fh,31h; //rdtsc
end;


procedure TReferenceList.SetRequisiteFilter( name_or_code:string );
begin
  requisite_filter := name_or_code;
end;

procedure TReferenceList.SetReferenceFilter( name_or_code:string );
begin

  reference_filter := name_or_code;
end;

//TRequisitesList---------------------------------------------------------------
constructor TReferenceList.Create();
begin
  inherited Create();
  reference_filter := '';
  requisite_filter := '';
end;


procedure TReferenceList.FeelVirtualTree( treeview:TVirtualStringTree );
var
  //ноды
  reference_node,
  section_node,
  requisite_node,
  view_node,
  view_folder_node:PVirtualNode;
  i,j,z:integer;
  i_requisite : integer;
  i_section_requisite : integer;
  dir_reference : TPointerDIRReference;
  ref_requisite : TPointerDIRReferenceRequisite;
  dir_requisite : TPointerDirReferenceRequisite;
  section       : TPointerDIRSection;
  section_list  : ^TSectionList;
  ref_req_list  : ^TRefRequisitesList;
  add_req : Boolean;
  add_ref : boolean;
  add_sec : boolean;
  index_by_code : integer;
  index_by_name : integer;
  node_data: PVSTRecord;

  node : PVirtualNode;
  temp_celltext : string;
begin
  treeview.NodeDataSize := SizeOf( TVSTRecord );
  treeview.Clear;
  for i := 0 to Count - 1 do
  begin
    add_ref := false;
    try
      dir_reference := TPointerDIRReference( @Items[i]^ );
      section_list  := @TSectionList( dir_reference.sections );
      ref_req_list  := @TRefRequisitesList( dir_reference.requisites );
      index_by_code := ref_req_list.IndexByCode( requisite_filter );
      index_by_name := ref_req_list.IndexByName( requisite_filter );
      //Фильтер-----------------------------------------------------------------
      try
        if not StringAssigned( requisite_filter ) then add_ref := true;
          if StringAssigned( requisite_filter ) then
            if ( ref_req_list.ContainsName( requisite_filter ) ) or
               ( ref_req_list.ContainsCode( requisite_filter ) ) then
                add_ref := true;
      except
        DebugMessage( 'Ошибка фильтра' );
        exit;
      end;
      //------------------------------------------------------------------------
      //DebugMessage( 'Фильтер пройден' );
      if add_ref then
      begin
        reference_node := treeview.AddChild( nil );
        node_data                := treeview.GetNodeData( reference_node );
        node_data.object_pointer := dir_reference;
        node_data.node_type      := dir_reference.object_type;
      end;  
    except
      DebugMessage('Ошибка при работе с узлом СПРАВОЧНИКА - ' + inttostr(i) );
      exit;
    end;
    //DebugMessage( 'Разбор секций справочника' );

    //ПРЕДСТАВЛЕНИЕ. Отобразить представления-----------------------------------
    view_folder_node         := treeview.AddChild( reference_node );
    node_data                := treeview.GetNodeData( view_folder_node );
    node_data.node_type      := folder_type;
    node_data.text           := 'Представления';
    for j:=0 to dir_reference.views.Count - 1 do
    begin
       view_node                := treeview.AddChild( view_folder_node );
       node_data                := treeview.GetNodeData( view_node );
       node_data.object_pointer := dir_reference.views.Items[ j ];
       node_data.node_type      := view_type;
       TPointerDirView( dir_reference.views.Items[ j ] ).RecursiveDrawStructure(
       view_node,
       TPointerDirView( dir_reference.views.Items[ j ] ).view_form,
       treeview );
    end;         
    //--------------------------------------------------------------------------

      if add_ref then
      for j:=0 to section_list.Count - 1 do
      begin
        try
          add_sec := false;
          section := @TPointerDIRSection( section_list.Items[j]^ );
          //Фильтер-------------------------------------------------------------
          if not StringAssigned( requisite_filter ) and ( section.requisites_list.Count > 0 ) then add_sec := true;
          if StringAssigned( requisite_filter ) then
            if ( section.requisites_list.ContainsName( requisite_filter ) ) or
               ( section.requisites_list.ContainsCode( requisite_filter ) ) then
                add_sec := true;
          //--------------------------------------------------------------------
          if add_sec then
          begin
            section_node             := treeview.AddChild( reference_node );
            node_data                := treeview.GetNodeData( section_node );
            node_data.object_pointer := section;
            node_data.node_type      := section.object_type;
            if section.code = 'К' then
              node_data.node_type := actions_section_type;
          end;
        except
          DebugMessage( 'Ошибка добавления раздела: ' + inttostr(i) );
          Exit;
        end;
        //DebugMessage( 'Разбор реквизитов секции' );

        //Разбор реквизитов секции----------------------------------------------
        if add_sec then
        for i_section_requisite:=0 to section.requisites_list.Count - 1 do
        begin
          add_req := false;

          try

            dir_requisite := TPointerDirReferenceRequisite( section.requisites_list.Items[ i_section_requisite ] );
            //Фильтер-----------------------------------------------------------
            if not StringAssigned( requisite_filter ) then add_req := true;
            if StringAssigned( requisite_filter ) then
              if ( Pos( LowerCase( requisite_filter ), ' ' + LowerCase( dir_requisite.name ) ) > 0 )
              or ( Pos( LowerCase( requisite_filter ), ' ' + LowerCase( dir_requisite.code ) ) > 0 )
                then add_req := true;
            //------------------------------------------------------------------

          except
            DebugMessage( 'Ошибка получения реквизита' );
            Exit;
          end;
          try
            //DebugMessage( 'Попытка добавить реквизит ' + dir_requisite.name );
            if add_req
              then
                begin
                  requisite_node  := treeview.AddChild( section_node );
                  node_data                := treeview.GetNodeData( requisite_node );
                  node_data.object_pointer := dir_requisite;
                  node_data.node_type      := dir_requisite.object_type;
                end;

            //DebugMessage( 'Реквизит добавлен ' + dir_requisite.name );
          except
            DebugMessage( 'Ошибка добавления реквизита' );
            Exit;
          end;
        end;
        //------------------------------------------------------------------------
             
      end;

  end;

end;


procedure TReferenceList.GetReferenceRequisiteDescription(dir_reference :
    TPointerDIRReference; dir_section:TPointerDIRSection);
var
  dir_requisite          : TPointerDIRReferenceRequisite;
  section_list           : ^TSectionList;
  ref_req_list           : ^TRequisitesList;
  ref_code, section_code : string;
  i                      : integer;
begin
//запрос----------------------------------------------------------------------
  sub_subquery_tool.Close;

  //В зависимости от объекта выбираем шаблон запроса SQL------------------------
  if dir_reference.object_type = reference_type then
  begin
    if dir_section.code = 'К' then
      sub_subquery_tool.SQL.Text := query_form.query_reference_action_list.Text
    else
      sub_subquery_tool.SQL.Text := query_form.query_get_reference_reqlist.Text;
  end;

  if dir_reference.object_type = document_type then
  begin
    if dir_section.code = 'К' then
      sub_subquery_tool.SQL.Text := query_form.query_document_action_list.Text
    else
      sub_subquery_tool.SQL.Text := query_form.query_document_get_reqlist.Text;
  end;
  //----------------------------------------------------------------------------

    //Подстановка новых значений------------------------------------------------
    sub_subquery_tool.SQL.Text := Replace( sub_subquery_tool.SQL.Text, '<ид_справочника>', IntToStr( dir_reference.vid ) );
    sub_subquery_tool.SQL.Text := Replace( sub_subquery_tool.SQL.Text, '<код_раздела>', dir_section.code );
    try
    sub_subquery_tool.Open;
    except
      EditText( '--Ошибка в запросе '+ #13 + sub_subquery_tool.SQL.Text );
    end;
    //--------------------------------------------------------------------------

    while not sub_subquery_tool.EOF do
    begin
      try
        New( dir_requisite );
        //обход строки результата---------------------------------------------------
        dir_requisite.required         := YesNoToBool( sub_subquery_tool.Fields[ FieldID('IsNull', sub_subquery_tool^) ].AsString );
        dir_requisite.on_form          := false;
        dir_requisite.filter           := YesNoToBool( sub_subquery_tool.Fields[ FieldID('IsKlass', sub_subquery_tool^) ].AsString );
        dir_requisite.sources          := YesNoToBool( sub_subquery_tool.Fields[ FieldID('IsSources', sub_subquery_tool^) ].AsString );
        dir_requisite.leader           := YesNoToBool( sub_subquery_tool.Fields[ FieldID('IsHigh', sub_subquery_tool^) ].AsString );
        dir_requisite.name             := sub_subquery_tool.Fields[ FieldID('name', sub_subquery_tool^) ].AsString;
        dir_requisite.code             := sub_subquery_tool.Fields[ FieldID('Kod', sub_subquery_tool^) ].AsString;
        dir_requisite.viewsOn          := TStringList.Create; // будет заполнено позднее
        dir_requisite.numrecv          := sub_subquery_tool.Fields[ FieldID('numrecv', sub_subquery_tool^) ].AsInteger;
        dir_requisite.name_localize_id := sub_subquery_tool.Fields[ FieldID('NameLocalizeID', sub_subquery_tool^) ].AsString;
        if dir_reference.object_type = reference_type then
        begin
          dir_requisite.filter           := YesNoToBool( sub_subquery_tool.Fields[ FieldID('IsKlass', sub_subquery_tool^) ].AsString );
          dir_requisite.sources          := YesNoToBool( sub_subquery_tool.Fields[ FieldID('IsSources', sub_subquery_tool^) ].AsString );
          if dir_section.code <> 'К' then
          begin
           dir_requisite.the_requisite    := requisites_list_db.GetRequisiteByCode( dir_requisite.code );
           dir_requisite.object_type      := reference_requisite_type;
          end
          else
            dir_requisite.object_type := requisite_action_type;
        end;

        if dir_reference.object_type = document_type then
        begin
          if dir_section.code <> 'К' then
          begin
            dir_requisite.the_requisite    := document_requisites_list_db.GetRequisiteByCode( dir_requisite.code );
            dir_requisite.object_type      := document_requisite_type;
          end
          else
            dir_requisite.object_type := requisite_action_type;
        end;

        dir_requisite.owner_object  := @dir_reference^;
        dir_requisite.owner_section := @dir_section^;
        ref_req_list                := @TRefRequisitesList( dir_reference.requisites );
        ref_req_list.Add( dir_requisite );
        section_list                := @TSectionList( dir_reference.sections );
        dir_section.requisites_list.Add( dir_requisite );

      except
        ShowMessage('Ошибка при загрузке метаданных: Реквизит: ' + dir_requisite.name + #13 + 'Справочник: ' + dir_reference.name );
        exit;
      end;
      sub_subquery_tool.Next;
      //--------------------------------------------------------------------------
    end;




end;



procedure TReferenceList.GetObjectSections( dir_reference:TPointerDIRReference );
var
  dir_requisite : TPointerDIRReferenceRequisite;
  dir_section   : TPointerDIRSection;

  section_list  : ^TSectionList;
  ref_req_list  : ^TRequisitesList;
  ref_code, section_code : string;

  i:integer;
begin
  //запрос----------------------------------------------------------------------
  //выбор шаблона запроса в зависимости от типа объекта
  subquery_tool.Close;
  if dir_reference.object_type = reference_type then
    subquery_tool.SQL.Text := query_form.query_section_list.Text;

  if dir_reference.object_type = document_type then
    subquery_tool.SQL.Text := query_form.query_document_section_list.Text;

  subquery_tool.SQL.Text := Replace( subquery_tool.SQL.Text, '<ид_справочника>', IntToStr( dir_reference.vid ) );
  subquery_tool.Open;
  //----------------------------------------------------------------------------

  while not subquery_tool.EOF do
  begin
    try
      New( dir_section );
      dir_section.name            := subquery_tool.Fields[ FieldID('Наименование', subquery_tool^) ].AsString;
      dir_section.code            := subquery_tool.Fields[ FieldID('Код',subquery_tool^) ].AsString;
      dir_section.preproc_name    := subquery_tool.Fields[ FieldID('PreprocИмя',subquery_tool^ )].AsString;
      dir_section.is_table        := YesNoToBool( subquery_tool.Fields[ FieldID('ТаблицаДаНет',subquery_tool^) ].AsString );
      dir_section.tablename       := subquery_tool.Fields[ FieldID('ФизИмя',subquery_tool^) ].AsString;
      dir_section.requisites_list := TRefRequisitesList.Create;
      dir_section.owner_object    := @dir_reference^;
      dir_section.object_type     := section_type;
      TSectionList( dir_reference.sections ).Add( @dir_section^ );

    except
      DebugMessage( 'Ошибка при загрузке метаданных: Разделы' );
      exit;
    end;

    GetReferenceRequisiteDescription( dir_reference, dir_section );

    subquery_tool.Next;
  end;

end;


procedure TReferenceList.GetObjectViews( dir_reference:TPointerDIRReference );
var
  dir_requisite : TPointerDIRReferenceRequisite;
  dir_view : TPointerDirView;
  i : integer;
begin

  dir_reference.views := TList.Create;
  //Получить список представлений-----------------------------------------------
  subquery_tool.Close;

  if dir_reference.object_type = reference_type then
    subquery_tool.SQL.Text := query_form.query_reference_views.Text;

  if dir_reference.object_type = document_type then
    subquery_tool.SQL.Text := query_form.query_document_views.Text;

  subquery_tool.SQL.Text := Replace( subquery_tool.SQL.Text, '<ид_справочника>', IntToStr( dir_reference.vid ) );
  subquery_tool.Open;
  //----------------------------------------------------------------------------

  while not subquery_tool.EOF do
  begin
    try
      New( dir_view );
      dir_view^               := TDIRView.Create;
      dir_view^.name          := subquery_tool.Fields[ FieldID('Name', subquery_tool^) ].AsString;
      dir_view^.dfm_text.Text := subquery_tool.Fields[ FieldID('Dfm',subquery_tool^) ].AsString;
      dir_view^.code          := subquery_tool.Fields[ FieldID('Kod',subquery_tool^) ].AsString;
      dir_view^.main          := YesNoToBool( subquery_tool.Fields[ FieldID('Kod',subquery_tool^) ].AsString );
      dir_view^.dir_reference := @dir_reference^;
      dir_reference.views.Add( @dir_view^ );
      dir_view^.ParseDFMTextView();
    except
      DebugMessage( 'Ошибка при загрузке метаданных: Разделы' );
      ShowDebug();
      exit;
    end;

    subquery_tool.Next;
  end;

end;

procedure TReferenceList.GetObjectDescription(queryText:string);
var
  dir_reference          : TPointerDIRReference;
  dir_requisite          : TPointerDIRReferenceRequisite;
  dir_section            : TPointerDIRSection;
  section_list           : ^TSectionList;
  ref_req_list           : ^TRequisitesList;
  ref_code, section_code : string;
  i                      : integer;
  cur_step               : integer;
  endOfObjectsList       : boolean;
  recordsCount           : Integer;
//  ObjectQuery          : TSQLDataSet;
  ObjectQuery            : TUniQuery;
  recNo                  : Integer;
  tickAfter              : int64;
  tickBefore             : int64;
  tickCycleAfter         : int64;
  tickCycleBefore        : int64;
  tickCycleTook          : int64;
  tickInfoText           : string;
  ticksTook              : int64;
  vidID                  : Integer;
begin

  tickBefore := GetCPUTick;

  ObjectQuery               := TUniQuery.Create(DIRAssistant);
//  ObjectQuery.SQLConnection := DIRAssistant.the_db_connection;
  ObjectQuery.Connection := DIRAssistant.UniConnection1;
  cur_step                  := 0;

  //запрос----------------------------------------------------------------------

  ObjectQuery.SQL.Text := queryText;
  ObjectQuery.Open;
  //----------------------------------------------------------------------------

  //Заполнить справочники-------------------------------------------------------
  while not ObjectQuery.EOF do
  begin

    tickCycleBefore := GetCPUTick();
    // отладка, сдвиг на нужный участок
    {
    if cur_step < 87  then
    begin
      Inc( cur_step );
      ObjectQuery.Next;
      progress_bar_form.Next;
      Continue;
    end;
    }

    recNo          := ObjectQuery.RecNo;
    New( dir_reference );
    dir_reference^ := TDIRReference.Create;

    if debug_object_grab_limit <> 0 then
      if cur_step >= debug_object_grab_limit then break;

    try
      dir_reference.vid              := ObjectQuery.FieldByName('ИД').AsInteger;
      dir_reference.code             := ObjectQuery.FieldByName('Код').AsString;

    // отладка, сдвиг на нужный участок

    if metadataGetOnlyList then
    if  metadataGetList.IndexOf( dir_reference.code ) < 0 then
    begin
      Inc( cur_step );
      ObjectQuery.Next;
      progress_bar_form.Next;
      Continue;
    end;

      dir_reference.name             := ObjectQuery.FieldByName('Name').AsString;
      progress_bar_form.SetDetailedText( dir_reference.name );
      dir_reference.name_localize_id := ObjectQuery.FieldByName('NameLocalizeID').AsString;
      dir_reference.spos_num         := ObjectQuery.FieldByName('SposNum' ).AsString;
      dir_reference.type_concept     := ObjectQuery.FieldByName('ОтображаемыйРеквизит').AsString;
      dir_reference.tablename        := ObjectQuery.FieldByName('TableName').AsString;
      dir_reference.common_settings  := ObjectQuery.FieldByName('НастройкиФормыСписка').AsString;
      dir_reference.add_params       := ObjectQuery.FieldByName('AddParams').AsString;
      dir_reference.comment          := ObjectQuery.FieldByName('Comment').AsString;
      dir_reference.object_type      := StringToMetadataObjectType( ObjectQuery.FieldByName('ObjectType').AsString );

      TRefRequisitesList( dir_reference^.requisites ) := TRefRequisitesList.Create;
      TSectionList( dir_reference^.sections )         := TSectionList.Create;

      Add( dir_reference );
    except
      DebugMessage( 'Ошибка при загрузке метаданных: Справочник' );
    end;

    // обработать разделы объекта
    GetObjectSections( dir_reference );

    // обработать представления объекта
    GetObjectViews( dir_reference );

    //--------------------------------------------------------------------------
    ObjectQuery.Next;
    Inc( cur_step );
    progress_bar_form.Next;
    endOfObjectsList := ObjectQuery.EOF;

    tickCycleAfter := GetCPUTick();
    tickCycleTook := tickCycleAfter - tickCycleBefore;
    tickInfoText := FormatCurr('Память: #,# Тиков', tickCycleTook);
    DebugMessage( 'Загрузка объекта: ' + dir_reference.name + ' > ' + tickInfoText );
  end;

  ObjectQuery.Free();

  tickAfter := GetCPUTick();
  ticksTook := tickAfter - tickBefore;

end;



procedure TReferenceList.FetchMetadataDescription();
var
  dir_reference : TPointerDIRReference;
  dir_requisite : TPointerDIRReferenceRequisite;
  dir_section   : TPointerDIRSection;

  section_list  : ^TSectionList;
  ref_req_list  : ^TRequisitesList;
  ref_code, section_code : string;

  i:integer;
  recordsAmmount: Integer;
begin
  progress_bar_form.Show;
  query_tool.Close;
  query_tool.SQL.Text :=  ' SELECT ( SELECT count(*) FROM [MBVidAn] ) + ( SELECT count(*) FROM [MBEDocType] ) ''Количество'' ';
  query_tool.Open;

  progress_bar_form.SetTitle( 'Загрузка метаданных' );
  recordsAmmount := query_tool.Fields[ FieldID('Количество', query_tool^) ].AsInteger;
  progress_bar_form.SetAmmount( recordsAmmount  );

  GetObjectDescription( query_form.query_get_reference_list.Text );
  GetObjectDescription( query_form.query_get_document_list.Text );

  progress_bar_form.Hide;

//  GetObjectDescription( query_form.query_get_reference_list.Text );
end;

procedure TReferenceList.ApplyVirtualVisibility( treeview:TVirtualStringTree );
var
  i:integer;
  node : PVirtualNode;
  data : PVSTRecord;
  node_name : string;
  node_code : string;
  temp_celltext : string;
begin
try

  for I := 0 to treeview.TotalCount - 1 do
    begin
      //Подготовка шага цикла---------------------------------------------------
      if I <> 0 then
        node := treeview.GetNext(node)
      else
        node := treeview.GetFirst;

      //по умолчанию узел отображается до тех пор пока его не скроет один из механизмов ниже
      treeview.IsVisible[ node ] := true;

      data := treeview.GetNodeData( node );
      if assigned( data ) then
      begin
      //------------------------------------------------------------------------

      if data.column1 = '' then
        DIRAssistant.VirtualStringTreeGetText(
          DIRAssistant.VirtualStringTree,
          node,
          0,
          ttNormal,
          temp_celltext
          );

      //ФИЛЬТР ПО ТЕКСТОВОМУ КРИТЕРИЮ-------------------------------------------

        //Фильтр по реквизитам--------------------------------------------------
        if ( data.node_type = reference_requisite_type  ) or
           ( data.node_type = document_requisite_type ) or
           ( data.node_type = action_type  ) or
           ( data.node_type = control_type  ) or
           ( data.node_type = requisite_action_type  )
           then
        if StringAssigned( references.requisite_filter ) then
        begin
          if not FindSubString( data.column1, references.requisite_filter ) and
             not FindSubString( data.column2, references.requisite_filter ) then
          begin
            treeview.IsVisible[ node ] := false;
          end;
        end;
        //----------------------------------------------------------------------

        //Фильтр по объектам----------------------------------------------------
        if ( data.node_type = reference_type ) or ( data.node_type = document_type ) then
        if StringAssigned( references.reference_filter ) then
        begin
          if not FindSubString(  data.column1, references.reference_filter ) and
             not FindSubString(  data.column2, references.reference_filter ) then
            treeview.IsVisible[ node ] := false;
        end;
        //----------------------------------------------------------------------

        //скрыть узлы справочников если их не хочет видеть пользователь-------
        if ( data.node_type = reference_type  ) and not DIRAssistant.mark_show_reference.Down then
        begin
          treeview.IsVisible[ node ] := false;
        end;
        //----------------------------------------------------------------------

        //скрыть узлы справочников если их не хочет видеть пользователь---------
        if ( data.node_type = document_type  ) and not DIRAssistant.mark_show_document.Down then
        begin
          treeview.IsVisible[ node ] := false;
        end;
        //----------------------------------------------------------------------
    end;

  end;

  //Скрыть все родительские узлы, дочерние узлы которых были скрыты------------
  for I := 0 to treeview.TotalCount - 1 do
  begin
    //Подготовка шага цикла
    if I <> 0 then
      node := treeview.GetNext( node )
    else
      node := treeview.GetFirst;

      if vsAllChildrenHidden in node.States then
      begin
        treeview.IsVisible[ node ] := false;
        if vsAllChildrenHidden in node.Parent.States then
        begin
          treeview.IsVisible[ node.Parent ] := false;
        end;
      end;
  end;
except
  on e:Exception do
    begin
      DebugMessage( 'TReferenceList.ApplyVirtualVisibility: необработанное исключение. ' + e.Message );
      ShowDebug();
    end;

end;
end;

procedure TReferenceList.SetDownloadQuery( query_text:string );
begin
  query := query_text;
end;

constructor TReferenceList.Create( db_connection:TSQLConnection );
begin
  inherited Create();
end;

procedure TReferenceList.ProcessRequisiteList();
begin
  
end;

procedure TReferenceList.SetConnection(db_connection: TSQLConnection);
begin

end;

function TReferenceList.IndexByName( name:string ):integer;
var
  i:integer;
begin
  result := -1;
  for i := 0 to Count - 1 do
  begin
    if TPointerDirRequisite( Items[i] ).name = name then
    result := i;
  end;
end;

function TReferenceList.IndexByCode( code:string ):integer;
var
  i:integer;
begin
  result := -1;
  for i := 0 to Count - 1 do
  begin
    if TPointerDirRequisite( Items[i] ).code = code then
    result := i;
  end;  
end;

function TReferenceList.RequisiteByCode( req_code: string ):TDIRRequisite;
begin


end;
//------------------------------------------------------------------------------



end.

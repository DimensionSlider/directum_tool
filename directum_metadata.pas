unit directum_metadata;

interface

uses classes, SQLExpr, sql_comfort_form, routine_strings, SysUtils; //DBXMSSQL;

type
   TMetadataObjectType = (
    reference_type,
    document_type,
    section_type,
    actions_section_type,
    requisite_action_type,
    reference_requisite_type,
    document_requisite_type,
    view_type,
    folder_type,
    requisite_type,
    action_type,
    control_type
     );


type
  // справочник или документ
  TPointerDIRReference = ^TDIRReference;
  TDIRReference = class(TObject)
    uid,
    name,
    name_localize_id,
    name_ed,
    spos_num, //способ нумерации
    type_concept, //отображаемый реквизит
    comment, //примечание к типу справочника
    code,
    add_params, //значени дополнительных параметров
    common_settings, //настройки формы-списка справочника
    tablename   : string[255];
    requisites  : Pointer; 
    sections    : Pointer;
    vid         : integer;
    object_type : TMetadataObjectType;
    views       : TList;

    public
      constructor Create;    
end;  

// Реквизит сам по себе в списке всех реквизитов
type
  TPointerDIRRequisite = ^TDIRRequisite;
  TDIRRequisite = record
    uid, name, code, fieldname: string[255];
    his_type      : string;
    typeStr : string;
    razd          : string;
    stored        : boolean;
    pick_values   : string;
    requisite_type: string;
    align         : string;
    len           : integer;
    vidan         : integer;
    viewID        : integer;
    exist_field   : boolean;
    toch          : integer;
    priznValue    : string;
    reftypeString : string;
    required      : boolean; //убрать. Забыл почему.
    isReference   : boolean;
    object_type   : TMetadataObjectType;

end;



type
  TView = class

end;

type
  TViewList = class( TList )

end;

// Реквизит справочника в конкретном справочнике
type TPointerDIRReferenceRequisite = ^TDIRReferenceRequisite;
  TDIRReferenceRequisite = record
    the_requisite     : TPointerDIRRequisite;
    owner_object      : TPointerDIRReference;
    owner_section     : Pointer;
    name              : string; //заголовок
    code              : string;
    required          : boolean;
    on_form           : boolean;
    leader            : boolean;
    viewsOn           : TStringList;
    readonly          : boolean;
    filter            : boolean;
    sources           : boolean;
    numrecv           : integer;
    name_localize_id  : string;
    input_expression  : string;
    priznValues       : string;
    object_type       : TMetadataObjectType;
    owner_object_type : TMetadataObjectType;


end;             

//база справочников
type
  TRefList = class( TList )

end;

function StringToMetadataObjectType( source_string:string ):TMetadataObjectType;

implementation

uses unit1, requisites_list, section_list;

function StringToMetadataObjectType( source_string:string ):TMetadataObjectType;
begin
  if source_string = 'reference' then
  Result := reference_type;

  if source_string = 'document' then
  Result := document_type;
end;


constructor TDIRReference.Create();
begin
  inherited Create();

end;


end.

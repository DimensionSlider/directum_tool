unit routine_directum_specific;

interface

uses Classes;

const
  route_param_type_integer = 0;
  route_param_type_double  = 1;
  route_param_type_string  = 2;
  route_param_type_pick    = 3;
  route_param_type_date    = 4;
  route_param_type_boolean = 5;
  route_param_type_task    = 6;
  route_param_type_job     = 7;
  route_param_type_folder  = 8;
  route_param_type_edoc    = 9;
  route_param_type_reference_record = 10;
  route_param_type_user    = 11;
  route_param_type_group    = 12;
  route_param_type_role    = 13;
  route_param_type_collection_integer = 14;
  route_param_type_collection_double = 15;
  route_param_type_collection_string = 16;
  route_param_type_collection_pick = 17;
  route_param_type_collection_date = 18;
  route_param_type_collection_boolean = 19;
  route_param_type_collection_tasks = 20;
  route_param_type_collection_jobs = 21;
  route_param_type_collection_folders = 22;
  route_param_type_collection_edocs = 23;
  route_param_type_collection_ref_records = 24;
  route_param_type_collection_users = 25;
  route_param_type_collection_groups = 26;
  route_param_type_collection_roles = 27;
  route_param_type_collection_objects = 28;
  route_param_type_user_list = 29;
  route_param_type_collection_accounts = 33;

function DirectumRouteParamTypeToString( type_id:integer ):string;

//��������� TreeView------------------------------------------------------------

//������ ���������--------------------------------------------------------------
type
    TReferenceRecordInfo = class( TObject )
    ID            : integer;
    Name          : string;
    SystemCode    : string;
    ComponentCode : string;
    ComponentName : string;
    Code          : string;
    ViewCode      : string;
  end;

type
  TEDocumentInfo = class( TObject )
  ID            : Integer;
  Name          : string;
  SystemCode    : string;
  Created       : TDateTime;
  Modified      : TDateTime;
  Editor        : integer;
  Author        : string;
  Signed        : boolean;
  SignatureType : string;
  UserStatus    : integer;
  Exporter      : string;
  ComponentCode : string;
  ComponentName : string;
  EncodeType    : integer;
  Storage       : string;
  TextModified  : TDateTime;
  EDocKind      : integer;
  CardType      : integer;
  LifeCycleStageName : string;
  HasBoundDocuments  : boolean;  

end;

//������� �������---------------------------------------------------------------

type
  TRouteParam = class( TObject )
  values : array of TObject;
  Name          : string;
  Description   : string;
  ReferenceCode : string;
  ParamType     : integer;

end;

type
  TRouteXMLSchema = class( TObject )
  params : array of TRouteParam;

end;

implementation

//------------------------------------------------------------------------------

function DirectumRouteParamTypeToString( type_id:integer ):string;
begin

  if type_id = 0 then Result  := '����� �����';
  if type_id = 1 then Result  := '������� �����';
  if type_id = 2 then Result  := '������';
  if type_id = 3 then Result  := '�������';
  if type_id = 4 then Result  := '����';
  if type_id = 5 then Result  := '���������� ��������';
  if type_id = 6 then Result  := '������';
  if type_id = 7 then Result  := '�������';
  if type_id = 8 then Result  := '�����';
  if type_id = 9 then Result  := '����������� ��������';
  if type_id = 10 then Result := '������ �����������';
  if type_id = 11 then Result := '������������';
  if type_id = 12 then Result := '������';
  if type_id = 13 then Result := '����';
  if type_id = 14 then Result := '��������� ����� �����';
  if type_id = 15 then Result := '��������� ������� �����';
  if type_id = 16 then Result := '��������� �����';
  if type_id = 17 then Result := '��������� ���������';
  if type_id = 18 then Result := '��������� ���';
  if type_id = 19 then Result := '��������� ���������� ��������';
  if type_id = 20 then Result := '��������� �����';
  if type_id = 21 then Result := '��������� �������';
  if type_id = 22 then Result := '��������� �����';
  if type_id = 23 then Result := '��������� ����������� ����������';
  if type_id = 24 then Result := '��������� ������� ������������';
  if type_id = 25 then Result := '��������� �������������';
  if type_id = 26 then Result := '��������� �����';
  if type_id = 27 then Result := '��������� �����';
  if type_id = 28 then Result := '������ ��������';
  if type_id = 29 then Result := '������ �������������';
  if type_id = 33 then Result := '��������� ������� �������';
//  if type_id = 32 then Result := 'PickSet';


end;

end.

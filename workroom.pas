unit workroom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, VirtualTrees, sEdit, sTreeView;

type
  Tworkroom_form = class(TForm)
    Edit1: TsEdit;
    Edit2: TsEdit;
    VirtualStringTree1: TVirtualStringTree;
    tv1: TsTreeView;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure VirtualStringTree1GetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure VirtualStringTree1FreeNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  workroom_form: Tworkroom_form;

implementation

uses unit1, reference_list, directum_metadata, section_list, virtual_tree_routine;

{$R *.dfm}

procedure Tworkroom_form.Edit1Change(Sender: TObject);
begin
  references.SetReferenceFilter( edit1.Text );
  references.ApplyVirtualVisibility( VirtualStringTree1 );
end;

procedure Tworkroom_form.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    references.SetRequisiteFilter( edit2.Text );
//    references.FeelTreeView( TreeView1 );
  end;
end;

procedure Tworkroom_form.VirtualStringTree1GetText(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType; var CellText: WideString);
var
  Data: PVSTRecord;
begin
 Data := Sender.GetNodeData(Node);
 if Assigned(Data) then
 begin
  if Data.node_type = reference_type then
    celltext := TPointerDIRReference( Data.object_pointer ).name;
    
  if Data.node_type = document_type then
    celltext := TPointerDIRReference( Data.object_pointer ).name;

  if Data.node_type = section_type then
    celltext := TPointerDIRSection( Data.object_pointer ).name;

  if Data.node_type = reference_requisite_type then
    celltext := TPointerDIRReferenceRequisite( Data.object_pointer ).name;
  if Data.node_type = document_requisite_type then
    celltext := TPointerDIRReferenceRequisite( Data.object_pointer ).name;


 end;
end;

procedure Tworkroom_form.VirtualStringTree1FreeNode(
  Sender: TBaseVirtualTree; Node: PVirtualNode);
var
 Data: PVSTRecord;
begin
 Data := Sender.GetNodeData(Node);
 if Assigned(Data) then
  Finalize(Data^);                
end;



procedure Tworkroom_form.Edit2Change(Sender: TObject);
begin
  references.SetRequisiteFilter( edit2.Text );
  references.ApplyVirtualVisibility( VirtualStringTree1 );
end;

end.
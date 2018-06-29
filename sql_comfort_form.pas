unit sql_comfort_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, SynHighlighterSQL, SynEdit, SynEditHighlighter, 
  SynMemo, ExtCtrls, sMemo, sBevel, sPageControl, sLabel;

type
  Tquery_form = class(TForm)
    PageControl1: TsPageControl;
    TabSheet1: TsTabSheet;
    TabSheet3: TsTabSheet;
    get_routexml_from_task: TsMemo;
    get_route_xml_from_route_reference: TsMemo;
    TabSheet4: TsTabSheet;
    Memo1: TsMemo;
    TabSheet5: TsTabSheet;
    Memo2: TsMemo;
    Label1: TsLabel;
    SynSQLSyn1: TSynSQLSyn;
    TabSheet2: TsTabSheet;
    SynMemo1: TSynMemo;
    Label2: TsLabel;
    db_params_delphi7: TSynEdit;
    Label3: TsLabel;
    TabSheet6: TsTabSheet;
    doc_query: TSynEdit;
    lbl2: TsLabel;
    lbl1: TsLabel;
    ref_query: TSynEdit;
    PageControl2: TsPageControl;
    TabSheet8: TsTabSheet;
    TabSheet7: TsTabSheet;
    query_get_reference_list: TSynEdit;
    Label5: TsLabel;
    Label8: TsLabel;
    query_get_document_list: TSynEdit;
    Label7: TsLabel;
    query_section_list: TSynEdit;
    TabSheet9: TsTabSheet;
    query_get_reference_reqlist: TSynEdit;
    Label6: TsLabel;
    TabSheet10: TsTabSheet;
    query_RecvAn: TSynEdit;
    Label4: TsLabel;
    query_document_section_list: TSynEdit;
    Label9: TsLabel;
    query_RecvEDoc: TSynEdit;
    Label10: TsLabel;
    Label11: TsLabel;
    query_document_get_reqlist: TSynEdit;
    TabSheet11: TsTabSheet;
    isb_object: TSynEdit;
    ts1: TsTabSheet;
    query_reference_views: TSynEdit;
    lbl4: TsLabel;
    lbl5: TsLabel;
    lbl6: TsLabel;
    query_document_views: TSynEdit;
    Label12: TsLabel;
    Label14: TsLabel;
    Label15: TsLabel;
    bvl1: TsBevel;
    query_reference_action_list: TSynEdit;
    lbl3: TsLabel;
    query_document_action_list: TSynEdit;
    lbl7: TsLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  query_form: Tquery_form;

implementation

{$R *.dfm}

end.
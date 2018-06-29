unit test_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Clipbrd, Grids, routine_strings, routine_directum_specific, 
  ComCtrls, Buttons, SynEdit, SynEditHighlighter, SynHighlighterDfm, 
  directum_view, ExtCtrls, DBCtrls, OleCtrls, SHDocVw, sPageControl, sEdit,
  sTreeView, sStatusBar, sListBox, sMemo, sButton, sSpeedButton, sLabel;

type
  Ttest_form = class(TForm)
    Button1: TsButton;
    Label1: TsLabel;
    Label2: TsLabel;
    Memo2: TsMemo;
    query_memo: TsMemo;
    ListBox1: TsListBox;
    Button2: TsButton;
    Button4: TsButton;
    lbl1: TsLabel;
    lbl2: TsLabel;
    stat1: TsStatusBar;
    TreeView1: TsTreeView;
    Label3: TsLabel;
    SpeedButton1: TsSpeedButton;
    Edit1: TsEdit;
    Label4: TsLabel;
    Button5: TsButton;
    memo1: TSynEdit;
    SynDfmSyn1: TSynDfmSyn;
    Edit2: TsEdit;
    Button6: TsButton;
    Button7: TsButton;
    SpeedButton2: TsSpeedButton;
    Button8: TsButton;
    Edit3: TsEdit;
    Button9: TsButton;
    Label5: TsLabel;
    pgc1: TsPageControl;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;


var
  test_form : Ttest_form;
  cur_i     : integer;


implementation

uses Unit1;

{$R *.dfm}

procedure Ttest_form.Button1Click(Sender: TObject);
var
  param_string_start  :integer;
  param_value_start   :integer;
  param_string_end    :integer;

  param_value         : string;
  param_value_ansi    : string;
  param_name          : string;
  param_string        : string;
  param_value_unicode : string;
  param_delimeter     : string;
  search_text         : string;
  requisites_on_form  : TStringList;
begin

requisites_on_form := TStringList.Create;

 query_tool.Close;
 query_tool.SQL.Text := query_memo.Text;
 query_tool.Open;
memo1.Text := query_tool.Fields[0].AsString;

  param_delimeter     := ' ';
  param_name          := 'RequisiteCode = ';
  param_string_start  := 1;
  search_text         := query_tool.Fields[0].AsString;

  while ( param_string_start <> 0 ) and ( param_string_end <> 0 )
  do begin
    param_string_start  := 0;
    param_string_end    := 0;

    param_string_start  := Pos( param_name, search_text );
    param_value_start   := param_string_start + length( param_name );
    param_string_end    := PosAfterPos( search_text, param_delimeter, param_value_start );

    if ( param_string_start <> 0 ) and ( param_string_end <> 0 ) then
    begin

      param_string        := CopyFromTo( search_text, param_string_start, param_string_end );
      param_value_unicode := CopyFromTo( search_text, param_value_start, param_string_end );
      param_value         := ConvertString( param_value_unicode );
      param_value         := Replace( param_value, '''','' );
      search_text         := ExtractAfter( search_text, param_string_end );
      memo2.Lines.Add( param_value + ' ' + IntToStr( param_string_start ) + ' ' + IntToStr( param_string_end )  + ' ' + param_string );
      ListBox1.Items.Add( param_value );

      if length( param_value ) > 0 then
        requisites_on_form.Add( param_value );
    end;

  end;

 // memo2.Text := requisites_on_form.Text;



end;

procedure Ttest_form.Button2Click(Sender: TObject);
var
  Strings:TStringList;
begin
  Strings := TStringList.Create;
  
  query_tool.Close;
  query_tool.SQL.Text := query_memo.Text;
  query_tool.Open;

  memo1.Text   := query_tool.Fields[0].AsString;
  Strings.Text := query_tool.Fields[0].AsString;
end;





procedure Ttest_form.Button3Click(Sender: TObject);
var
   view_form_control: ^TViewFormControl;
   cur_control      : ^TViewFormControl;
   parent_control   : ^TViewFormControl;


begin
  {
      new( view_form_control );
      cur_control      := Addr( view_form_control );
      cur_control.left := 50;
      ShowMessage( IntToStr( cur_control.left ) ) ;
      parent_control := cur_control;
      ShowMessage( IntToStr( parent_control.left ) ) ;

                                            }
end;

procedure Ttest_form.SpeedButton1Click(Sender: TObject);
var
    clip : TClipboard;
begin
  clip := TClipboard.Create;
clip.AsText := Memo1.Lines.Text;
end;

procedure Ttest_form.Button5Click(Sender: TObject);
begin
  cur_i := StrToInt( Edit1.text );
end;

procedure Ttest_form.FormCreate(Sender: TObject);
begin
  cur_i := -1;
end;

procedure Ttest_form.Button6Click(Sender: TObject);
var
    i,j:integer;
    level:integer;
    node : TTreeNode;
begin
  for i:=0 to TreeView1.Items.Count - 1 do
  begin
    if TreeView1.Items.Item[i].Text = Edit2.Text then
      begin
        node := TreeView1.Items.Item[i];
        level := node.Level;
        ShowMessage( IntToStr( level ) );
        for j:= TreeView1.Items.Item[i].Level downto 0+1 do
        begin
          node.Parent.Expand( false );
          node := node.parent;
        end;
        TreeView1.Selected := TreeView1.Items.Item[i];

      end;
  end;


end;



procedure Ttest_form.Button7Click(Sender: TObject);
var
  form:TForm;
begin
//  RecursiveDrawForm( view_form^, nil );

end;

procedure Ttest_form.SpeedButton2Click(Sender: TObject);
var
    clip : TClipboard;
begin
  clip        := TClipboard.Create;
  clip.AsText := Memo2.Lines.Text;
end;

procedure Ttest_form.Button8Click(Sender: TObject);
begin
  Memo1.GotoLineAndCenter( StrToInt( Edit3.Text ) );
end;

procedure Ttest_form.Button9Click(Sender: TObject);
var
  i:integer;
  cur_string:string;
  label restart;
begin
  restart:
  for i:= 0 to Memo1.Lines.Count - 1 do
  begin
    cur_string := memo1.Lines[i];
    if ( pos( 'object', ' ' + cur_string ) = 0 ) and
       ( pos( 'inherited', ' ' + cur_string ) = 0 ) and
       ( pos( 'end', ' ' + cur_string ) = 0 ) then
       begin
         Memo1.Lines.Delete( i );
         goto restart;
       end;


  end;
end;

end.
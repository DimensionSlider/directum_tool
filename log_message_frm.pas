unit log_message_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Clipbrd, SynEdit, ExtCtrls, JvExControls, JvEditorCommon,
  JvEditor, JvHLEditor;

type
  Tlog_message_form = class(TForm)
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Button3: TButton;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    message_text: TSynEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    error_message:string;
    stack_message:string;
    procedure ShowMessage( error,stack:string );
    { Public declarations }
  end;

var
  log_message_form: Tlog_message_form;

implementation

{$R *.dfm}

procedure Tlog_message_form.Button2Click(Sender: TObject);
begin
  clipboard.AsText := message_text.Lines.Text;
  close;
end;

procedure Tlog_message_form.Button3Click(Sender: TObject);
begin
  clipboard.AsText := error_message;
  close;
end;

procedure Tlog_message_form.Button4Click(Sender: TObject);
begin
  clipboard.AsText := stack_message;
  close;
end;

procedure Tlog_message_form.ShowMessage( error,stack:string );
begin
 error_message := error;
 stack_message := stack;
 message_text.Lines.Text := 'Ошибка: ' + #13 + error + #13 +#13 + 'Стек:' + #13 + stack;
 Show;
 BringToFront;
end;

procedure Tlog_message_form.Button1Click(Sender: TObject);
begin
 Close;
end;

end.

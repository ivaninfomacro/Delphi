unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    sevenButton: TButton;
    eightButton: TButton;
    nineButton: TButton;
    fourButton: TButton;
    fiveButton: TButton;
    sixButton: TButton;
    oneButton: TButton;
    twoButton: TButton;
    threeButton: TButton;
    zeroButton: TButton;
    decimalButton: TButton;
    signButton: TButton;
    equalsButton: TButton;
    plusButton: TButton;
    minusButton: TButton;
    multButton: TButton;
    divButton: TButton;
    clearButton: TButton;
    backButton: TButton;
    screen: TEdit;
    procedure numberButtonClick(Sender: TObject);
    procedure plusButtonClick(Sender: TObject);
    procedure minusButtonClick(Sender: TObject);
    procedure multButtonClick(Sender: TObject);
    procedure divButtonClick(Sender: TObject);
    procedure equalsButtonClick(Sender: TObject);
    procedure clearButtonClick(Sender: TObject);
    procedure backButtonClick(Sender: TObject);
    procedure signButtonClick(Sender: TObject);
    procedure decimalButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  first: Double;
  second: Double;
  currentOperation : Integer;   {* -1=equal or clear
                                   0=nothing
                                   1=addition
                                   2=subtraction
                                   3=multiplication
                                   4=division *}

implementation

{$R *.dfm}

procedure calculate;
begin
  if first <> 0 then
  begin
    second := StrToFloat(Form1.screen.Text);

    case currentOperation of
      1 : first := first + second;
      2 : first := first - second;
      3 : first := first * second;
      4 : first := first / second;
    end;

  end
  else
  begin
    first := StrToFloat(Form1.screen.Text);
  end;

end;

procedure TForm1.backButtonClick(Sender: TObject);
begin
  screen.Text := Copy(screen.Text, 1, Length(screen.Text)-1);
end;

procedure TForm1.clearButtonClick(Sender: TObject);
begin
  first := 0;
  second := 0;
  currentOperation := -1;
  screen.Text := '';
end;

procedure TForm1.decimalButtonClick(Sender: TObject);
begin
  if currentOperation < 0 then
  begin
    screen.Text := '';
    currentOperation := 0;
  end;

  if screen.Text = '' then
  begin
    screen.Text := '0.';
  end else if Pos('.', screen.Text) = 0 then
  begin
    screen.Text := screen.Text + '.';
  end;
end;

procedure TForm1.divButtonClick(Sender: TObject);
begin
  calculate;
  currentOperation := 4;
  screen.Text := '';
end;

procedure TForm1.equalsButtonClick(Sender: TObject);
begin
  calculate;
  screen.Text := FloatToStr(first);
  first := 0;
  second := 0;
  currentOperation := -1;
end;

procedure TForm1.minusButtonClick(Sender: TObject);
begin
  calculate;
  currentOperation := 2;
  screen.Text := '';
end;

procedure TForm1.plusButtonClick(Sender: TObject);
begin
  calculate;
  currentOperation := 1;
  screen.Text := '';
end;

procedure TForm1.signButtonClick(Sender: TObject);
begin
  if screen.Text[1] = '-' then
  begin
    screen.Text := Copy(screen.Text, 2, Length(screen.Text));
  end else
  begin
    screen.Text := '-' + screen.Text;
  end;
end;

procedure TForm1.multButtonClick(Sender: TObject);
begin
  calculate;
  currentOperation := 3;
  screen.Text := '';
end;

procedure TForm1.numberButtonClick(Sender: TObject);
begin
  if currentOperation < 0 then
  begin
    screen.Text := '';
    currentOperation := 0;
  end;
  screen.Text :=  screen.Text + TButton(Sender).Caption;
end;

end.

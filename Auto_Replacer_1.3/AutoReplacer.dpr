program AutoReplacer;

uses
  Forms,
  strchang in 'strchang.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

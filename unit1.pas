unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, EditBtn, StdCtrls, IdHTTP, IdMultipartFormData;

const
  URL = 'https://localhost:44335/Home/Lahetalinkki';

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    FileNameEdit1: TFileNameEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Indy: TIdHTTP;
  Params: TIdMultiPartFormDataStream;
  Response: string;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Indy := TIdHTTP.Create;
  Params :=  TIdMultiPartFormDataStream.Create;
  try
    try
      Params.AddFile('tiedostot', FileNameEdit1.FileName);
      Params.AddFormField('kenelle', Edit1.Text);
      Params.AddFormField('kuvaus', Edit2.Text);
      Response := Indy.Post(URL, Params);
      ShowMessage(Response);
    except
        ShowMessage('Virhe!');
    end;
  finally
    Params.Free;
    Indy.Free;
  end;
end;

end.


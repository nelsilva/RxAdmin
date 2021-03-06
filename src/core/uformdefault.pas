unit uFormDefault;

interface

uses
  Classes, SysUtils, Controls,
  Forms, StdCtrls, ExtCtrls, RaApplication, RaBase, RaControlsVCL;

type

  { TFormDefault }

  TFormDefault = class(TRaFormCompatible)
    RaButton1: TRaButton;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDefaultCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    FCallBack_OnClose: TNotifyEvent;
    FBTN_BringToFront: TRaButton;
    FRaAlign: TAlign;
    FRaResizeForm: TNotifyEvent;
    procedure SetRaAlign(const Value: TAlign);
    procedure SetRaResizeForm(const Value: TNotifyEvent);

  public
    { public declarations }
    property CallBack_OnClose: TNotifyEvent read FCallBack_OnClose
      write FCallBack_OnClose;
    property BTN_BringToFront: TRaButton read FBTN_BringToFront write FBTN_BringToFront;
    property RaAlign: TAlign read FRaAlign write SetRaAlign;
    property RaResizeForm: TNotifyEvent read FRaResizeForm write SetRaResizeForm;
  end;

var
  FormDefault: TFormDefault;

implementation

{$R *.lfm}

{ TFormDefault }

procedure TFormDefault.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  case Assigned(FCallBack_OnClose) of
    True: FCallBack_OnClose(Sender)
  end;

end;

procedure TFormDefault.FormDefaultCreate(Sender: TObject);
begin

end;

procedure TFormDefault.SetRaAlign(const Value: TAlign);
begin
  FRaAlign := Value;
end;

procedure TFormDefault.SetRaResizeForm(const Value: TNotifyEvent);
begin
  FRaResizeForm := Value;
end;

procedure TFormDefault.FormShow(Sender: TObject);
begin
  if Assigned(FRaResizeForm) then
    FRaResizeForm(Sender);
end;

end.

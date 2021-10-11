unit strchang;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, FileCtrl, ShellApi, Buttons, ExtCtrls,
  IniFiles;

type
  TForm2 = class(TForm)
    Button1: TButton;
    RichEdit1: TRichEdit;
    Label6: TLabel;
    Label7: TLabel;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    FilterComboBox1: TFilterComboBox;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox6: TCheckBox;
    Edit1: TEdit;
    Label8: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    ListView1: TListView;
    Button5: TButton;
    SaveDialog1: TSaveDialog;
    ComboBox1: TComboBox;
    SpeedButton2: TSpeedButton;
    procedure Button2Click(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboBox1CloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Set_Buttons;
    procedure FindFile(Dir: string);
  end;

var
  Form2: TForm2;
  all_files: integer;
  stop: boolean=false;
  Str: TStringList;
  ARIni: TIniFile;
  path: string;

implementation

{$R *.dfm}

procedure TForm2.Set_Buttons;
begin
 Button1.Enabled:=not (ComboBox1.Text='');
                  // or (Edit3.Text)='');
 Button4.Enabled:=Button1.Enabled;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 FileListBox1.SelectAll;
 Label2.Caption:='Всего файлов: '+IntToStr(FileListBox1.Items.Count);
 Label3.Caption:='Выделенных файлов: '+IntToStr(FileListBox1.Items.Count);
end;

procedure TForm2.DirectoryListBox1Change(Sender: TObject);
begin
 Label2.Caption:='Всего файлов: '+IntToStr(FileListBox1.Items.Count);
end;

procedure TForm2.FormCreate(Sender: TObject);
var
 s: string;
 Str2: TStringList;
begin
 Button1.Width:=Form2.Width-(Button1.Left+14);
 Button2.Width:=Form2.Width-(Button2.Left+14);
 GroupBox1.Width:=Form2.Width-(GroupBox1.Left+14);
 SpeedButton1.Height:=Panel1.Height-2;
 SpeedButton1.Width:=Panel1.Width-2;

 Application.Title:=Form2.Caption;

 Str:=TStringList.Create;
 Str2:=TStringList.Create;

 path:=ExtractFilePath(ParamStr(0));
 ARIni:=TIniFile.Create(path+'AutoReplacer.ini');

 ARIni.ReadSection('ReplaceShablon', Str2);
 ComboBox1.Items:=Str2;

 Str2.Free;
end;

procedure TForm2.ComboBox1CloseUp(Sender: TObject);
begin
 if Trim(ComboBox1.Text)=''
 then Exit;

 Edit3.Text:=ARIni.ReadString('ReplaceShablon',ComboBox1.Items.Strings[ComboBox1.ItemIndex],'');
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
 if (Trim(ComboBox1.Text)<>'') and (Trim(Edit3.Text)<>'')
 then ARIni.WriteString('ReplaceShablon',ComboBox1.Text,Edit3.Text);
end;

procedure TForm2.FileListBox1Click(Sender: TObject);
var
 i,j: integer;
begin
 j:=0;
 for i:=0 to FileListBox1.Items.Count-1 do
  begin
   if FileListBox1.Selected[i]
   then inc(j);
  end;
 Label3.Caption:='Выделенных файлов: '+IntToStr(j);
end;

procedure TForm2.FileListBox1Change(Sender: TObject);
var
 i,j: integer;
begin
 j:=0;
 for i:=0 to FileListBox1.Items.Count-1 do
  begin
   if FileListBox1.Selected[i]
   then inc(j);
  end;
 Label3.Caption:='Выделенных файлов: '+IntToStr(j);
end;

procedure TForm2.FormShow(Sender: TObject);
var
 i,j: integer;
begin
 Label2.Caption:='Всего файлов: '+IntToStr(FileListBox1.Items.Count);
 j:=0;
 for i:=0 to FileListBox1.Items.Count-1 do
  begin
   if FileListBox1.Selected[i]
   then inc(j);
  end;
 //
 Label3.Caption:='Выделенных файлов: '+IntToStr(j);
 //
 Set_Buttons;
 //
 if ComboBox1.CanFocus
 then ComboBox1.SetFocus;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 FS: TFileStream;
 nitem: TListItem;
 s,ss,s1,s2,filesize1,filesize2: string;
 i,j,k,n,z,filecol,allf,f,procent,zam,nezam: integer;
begin
 Label8.Caption:='Не произведено замен: 0';
 //
 RichEdit1.Lines.Clear;
 ListView1.Clear;
 //
 allf:=0;
 for i:=0 to FileListBox1.Items.Count-1 do
  begin
   if FileListBox1.Selected[i]
   then inc(allf);
  end;
 // 
 if allf=0
 then
  begin
   MessageDlg('Файлы для обработки не выбраны!',mtInformation,[mbOK],0);
   Exit;
  end;
 //
 with ProgressBar1 do
  begin
   Max:=allf;
   Refresh;
   Show;
  end;
 //
 Button3.Enabled:=true;
 //
 f:=0;
 filecol:=0;
 RichEdit1.Lines.BeginUpdate;
 //
 for k:=0 to FileListBox1.Items.Count-1 do
  begin
   Button1.Enabled:=false;
   Button2.Enabled:=false;
   Button4.Enabled:=false;
   CheckBox1.Enabled:=false;
   FileListBox1.Enabled:=false;
   DriveComboBox1.Enabled:=false;
   FilterComboBox1.Enabled:=false;
   DirectoryListBox1.Enabled:=false;
   if FileListBox1.Selected[k]
   then
    begin
     try
      //
      s:=FileListBox1.Items.Strings[k];
      if CheckBox1.Checked
      then
       begin
        j:=pos('.',s);
        s1:=Copy(s,1,j-1);
        s2:=Copy(s,j,10);
        s:=s1+'_backup'+s2;
        if FileExists(s)=false // CopyFile(false - overvrite file);
        then CopyFile(PChar(FileListBox1.Items.Strings[k]),PChar(s),false);
       end;
      //
      filesize1:='';
      try
       FS:=TFileStream.Create(s,fmOpenRead);
       filesize1:=IntToStr(FS.Size);
       FS.Free;
      except
       filesize1:='';
       FS.Free;
      end;
      //
      RichEdit1.Lines.Clear;
      RichEdit1.Lines.LoadFromFile(FileListBox1.Items.Strings[k]);
      // Замена строк
      s:=ComboBox1.Text;
      nezam:=0;
      zam:=0;
      for i:=0 to RichEdit1.Lines.Count-1 do
       begin
        j:=0;
        z:=0;
        Edit1.Text:=RichEdit1.Lines.Strings[i];
        ss:=Edit1.Text;
        if pos(s,ss)<>0
        then
         begin
          while j<=Length(ss) do
           begin
            n:=pos(s,ss);
            if n<>0
            then
             begin
              Edit1.HideSelection:=false;
              Edit1.SelStart:=z+n-1;
              Edit1.SelLength:=length(s);
              Edit1.SelText:=Edit3.Text;
              inc(zam);
              inc(j);
              ss:=Edit1.Text;
              Delete(ss,1,z+n+length(Edit3.Text)-1);
              z:=z+n+length(Edit3.Text)-1;
              Application.ProcessMessages;
              if stop=true
              then Exit;
             end
            else
             begin
              RichEdit1.Lines.Strings[i]:=Edit1.Text;
              Break;
             end;
           end;
           RichEdit1.Lines.Strings[i]:=Edit1.Text;
         end;
        Application.ProcessMessages;
       end;
      if zam=0
      then
       begin
        inc(nezam);
        Label8.Caption:='Не произведено замен: '+IntToStr(nezam);
       end;
      /////////////////////////////////////////
      RichEdit1.Lines.SaveToFile(FileListBox1.Items.Strings[k]);
      inc(filecol);
      //
      filesize2:='';
      try
       FS:=TFileStream.Create(FileListBox1.Items.Strings[k],fmOpenRead);
       filesize2:=IntToStr(FS.Size);
       FS.Free;
      except
       filesize2:='';
       FS.Free;
      end;
      //
      procent:=100-Round(StrToInt(filesize2)*100/StrToInt(filesize1));
      Label1.Caption:='Статус замены: обработано '+IntToStr(filecol)+' файлов из '+IntToStr(allf);
      //

      nitem:=ListView1.Items.Add();
      nitem.Caption:=FileListBox1.Items.Strings[k]; // filename
      nitem.SubItems.Add(filesize1); // размер до
      nitem.SubItems.Add(filesize2); // размер после
      nitem.SubItems.Add(IntToStr(zam)); // кол-во замен

      // просмотр в браузере
      if CheckBox6.Checked
      then ShellExecute(0,'open',PChar(FileListBox1.Items.Strings[k]),'','',SW_SHOW);
      //
      f:=f+1;
      ProgressBar1.Position:=f;
     except

     end;
    end;
  end;
 RichEdit1.Lines.EndUpdate;
 Sleep(100);
 Button1.Enabled:=true;
 Button2.Enabled:=true;
 Button4.Enabled:=true; 
 CheckBox1.Enabled:=true;
 FileListBox1.Enabled:=true;
 DriveComboBox1.Enabled:=true;
 FilterComboBox1.Enabled:=true;
 DirectoryListBox1.Enabled:=true;
 ProgressBar1.Position:=0;
 FileListBox1.Update; // обновление данных в FileListBox1
 Button3.Enabled:=false;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
 stop:=true;
 Button1.Enabled:=true;
 Button2.Enabled:=true;
 Button3.Enabled:=false;
end;

procedure TForm2.Button4Click(Sender: TObject);
var
 FS: TFileStream;
 nitem: TListItem; 
 Strl: TStringList;
 s,ss,s1,s2,filesize1,filesize2: string;
 i,j,k,n,z,filecol,allf,f,procent,zam,nezam: integer;
begin
 if OpenDialog1.Execute then
  begin
   Strl:=TStringList.Create;
   Strl.LoadFromFile(OpenDialog1.FileName);
   //////////////////////////////////////////////////////////
   Button3.Enabled:=true;
   Label8.Caption:='Не произведено замен: 0';
   //
   RichEdit1.Lines.Clear;
   ListView1.Clear;
   //
   Button1.Enabled:=false;
   Button2.Enabled:=false;
   Button4.Enabled:=false;
   CheckBox1.Enabled:=false;
   FileListBox1.Enabled:=false;
   DriveComboBox1.Enabled:=false;
   FilterComboBox1.Enabled:=false;
   DirectoryListBox1.Enabled:=false;
   //
   allf:=Strl.Count;
   //
   with ProgressBar1 do
    begin
     Max:=allf;
     Refresh;
     Show;
    end;
   //
   f:=0;
   filecol:=0;
   RichEdit1.Lines.BeginUpdate;
   for k:=0 to Strl.Count-1 do
    begin
     try
      s:=Strl.Strings[k];
      if CheckBox1.Checked
      then
       begin
        j:=pos('.',s);
        s1:=Copy(s,1,j-1);
        s2:=Copy(s,j,10);
        s:=s1+'_backup'+s2;
        if FileExists(s)=false // CopyFile(false - overvrite file);
        then CopyFile(PChar(Strl.Strings[k]),PChar(s),false);
       end;
      //
      filesize1:='';
      try
       FS:=TFileStream.Create(s,fmOpenRead);
       filesize1:=IntToStr(FS.Size);
       FS.Free;
      except
       filesize1:='';
       FS.Free;
      end;
      //
      RichEdit1.Lines.Clear;
      RichEdit1.Lines.LoadFromFile(Strl.Strings[k]);
      // Замена строк
      s:=ComboBox1.Text;
      nezam:=0;
      zam:=0;
      for i:=0 to RichEdit1.Lines.Count-1 do
       begin
        j:=0;
        z:=0;
        Edit1.Text:=RichEdit1.Lines.Strings[i];
        ss:=Edit1.Text;
        if pos(s,ss)<>0
        then
         begin
          while j<=Length(ss) do
           begin
            n:=pos(s,ss);
            if n<>0
            then
             begin
              Edit1.HideSelection:=false;
              Edit1.SelStart:=z+n-1;
              Edit1.SelLength:=length(s);
              Edit1.SelText:=Edit3.Text;
              inc(zam);
              inc(j);
              ss:=Edit1.Text;
              Delete(ss,1,z+n+length(Edit3.Text)-1);
              z:=z+n+length(Edit3.Text)-1;
              Application.ProcessMessages;
              if stop=true
              then Exit;
             end
            else
             begin
              RichEdit1.Lines.Strings[i]:=Edit1.Text;
              Break;
             end;
           end;
           RichEdit1.Lines.Strings[i]:=Edit1.Text;
         end;
        Application.ProcessMessages;
       end;
      if zam=0
      then
       begin
        inc(nezam);
        Label8.Caption:='Не произведено замен: '+IntToStr(nezam);
       end;
      /////////////////////////////////////////
      RichEdit1.Lines.SaveToFile(Strl.Strings[k]);
      inc(filecol);
      //
      filesize2:='';
      try
       FS:=TFileStream.Create(Strl.Strings[k],fmOpenRead);
       filesize2:=IntToStr(FS.Size);
       FS.Free;
      except
       filesize2:='';
       FS.Free;
      end;
      //
      procent:=100-Round(StrToInt(filesize2)*100/StrToInt(filesize1));
      Label1.Caption:='Статус замены: обработано '+IntToStr(filecol)+' файлов из '+IntToStr(allf);

      nitem:=ListView1.Items.Add();
      nitem.Caption:=Strl.Strings[k]; // filename
      nitem.SubItems.Add(filesize1); // размер до
      nitem.SubItems.Add(filesize2); // размер после
      nitem.SubItems.Add(IntToStr(zam)); // кол-во замен

      // просмотр в браузере
      if CheckBox6.Checked
      then ShellExecute(0,'open',PChar(Strl.Strings[k]),'','',SW_SHOW);
      //
      f:=f+1;
      ProgressBar1.Position:=f;
     except
      
     end;
    end;
   RichEdit1.Lines.EndUpdate;
   Sleep(100);
   Button1.Enabled:=true;
   Button2.Enabled:=true;
   Button4.Enabled:=true;
   CheckBox1.Enabled:=true;
   FileListBox1.Enabled:=true;
   DriveComboBox1.Enabled:=true;
   FilterComboBox1.Enabled:=true;
   DirectoryListBox1.Enabled:=true;
   ProgressBar1.Position:=0;
   FileListBox1.Update; // обновление данных в FileListBox1
   Button3.Enabled:=false;
   ///////////////////////////////////////////////////////////
   Strl.Free;
  end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
 ShowMessage('-------------------  '+Form2.Caption+'  -------------------'+#10#13+
             'Программа для автоматической замены текста'+#10#13+
             'в файлах.'+#10#13+
             '              Copyright © 2004-2011 Delphi Sources.'+#10#13+
             '------------------------------------------------------------------'+#10#13+
             'Вопросы, пожелания и замечания по работе'+#10#13+
             'программы присылайте на адрес:'+#10#13+
             ' '+#10#13+             
             'E-mail: admin_ds@delphisources.ru'+#10#13+
             'Web-Site: www.delphisources.ru');
 ShellExecute(0,'open','http://www.delphisources.ru','','',SW_SHOW);
end;

procedure TForm2.Edit2Change(Sender: TObject);
begin
 Set_Buttons;
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
 Set_Buttons;
end;

//////////////////////////////////////////////////////////////

procedure TForm2.FindFile(Dir: string);
var
 SR: TSearchRec;
 FindRes: integer;
 Dir1: string;
begin
 Dir1:=Dir;
 Dir:=Dir+'\';
 FindRes:=FindFirst(Dir+FilterComboBox1.Mask,faAnyFile,SR);
 while FindRes=0 do
  begin
   if ((SR.Attr and faDirectory)=faDirectory) and
                               ((SR.Name='.') or (SR.Name='..'))
   then
    begin
     FindRes:=FindNext(SR);
     Continue;
    end;
   // если найден каталог, то
   if ((SR.Attr and faDirectory)=faDirectory)
   then
    begin
     // входим в процедуру поиска с параметрами текущего каталога +
     // каталог, что мы нашли
     FindFile(Dir+SR.Name);
     FindRes:=FindNext(SR);
     // после осмотра вложенного каталога мы продолжаем поиск
     // в этом каталоге
     Continue; // продолжить цикл
    end;
   all_files:=all_files+1;
   Str.Add(Dir1+'\'+Sr.Name);
   //
   if Application.Terminated
   then Break;
   //
   Application.ProcessMessages;
   FindRes:=FindNext(SR);
  end;
 FindClose(SR);
end;

procedure TForm2.Button5Click(Sender: TObject);
var
 s: string;
 i,j,k: integer;
begin
 SaveDialog1.Title:='Сохранение списка страниц';
 //
 Str.BeginUpdate;
 Str.Clear;
 //
 all_files:=0;
 //
 if DirectoryListBox1.Directory<>''
 then
  begin
   FindFile(DirectoryListBox1.Directory);
   //
   s:=InputBox('Сохранение списка страниц','Введите имя файла:','page_list');
   if s<>''
   then
    begin
     SaveDialog1.FileName:=s;
     if SaveDialog1.Execute
     then
      begin
       s:=SaveDialog1.FileName;
       Str.SaveToFile(s);
      end;
    end;
   MessageDlg('Добавлено файлов: '+IntTostr(all_files),mtInformation,[mbOK],0);
  end;
 // 
 Str.EndUpdate;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Str.Free;
 ARIni.Free;
end;

end.

procedure GenerateNumbersForMemory();
var
  x,wert:integer;
  Bitmap:TBitmap;
  Image:TImage;
  IntArr:Array[1..31] of Integer;
begin
  Randomize;

  for x:= 1 to Length(IntArr)-1 do
  begin
    repeat
      Wert:= Random(31);
    until not IntInArray(Wert,IntArr);

    IntArr[x]:= Wert;
  end;

  for x:= 1 to Length(IntArr)-1 do
  begin
    if IntArr[x] > 15 then
      IntArr[x]:= IntArr[x]-15;
    ListBox1.Items.Add(IntToStr(IntArr[x]));
  end;


  //Darstellung auf Bitmaps

  Bitmap:= TBitmap.Create;

  for x:= 1 to Length(IntArr)-1 do
  begin
    Image:= Self.FindChildControl('Image' + IntToStr(i)) as TImage;
    ImageList1.GetBitmap(IntArr[x]-1,Bitmap);
    Image.Canvas.Draw(0,0,Bitmap);
  end;
end;  
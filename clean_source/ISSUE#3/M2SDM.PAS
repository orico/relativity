{$m 20000,0,0} {don't forget to reduce the heap!}
uses sds, crt, alloc, files;

const
    message : array [0..13] of string = (
      '',
      'File not found',
      'Bad module or incorrect format',
      'Not enough memory',
      'Unknown module format',
      'Error shrinking patterns',
      'Invalid instrument descriptor',
      'Unknown compression type',
      'internal (contact me now!)',
      'internal (contact me now!)',
      'Unexpected end of chunk (EOC missing)',
      'Missing/invalid MINF chunk',
      'SDAT chunk without its previous SDES',
      'Unexpected end of file (missing chunks)'
    );

var module  : pointer;
    cevent  : array [0..31] of array [0..4] of byte;
    a,b,c,d : word;
    sh:sdmint_headtype;
    card,base,irq,dma:word;
    services : pointer;
    ch:char;
    k:word;

begin
  writeln('旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�');
  writeln('�  Sound Deluxe System 5, a Maple Leaf production, 1996-1997      �');
  writeln('�  Module to SDM convertor v1.2                                   �');
  writeln('�  Supported formats: MOD,STM,S3M,MTM,669,FAR,ULT,PTM,SDM         �');
  writeln('�  컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�  �');
  writeln('�  For problems/questions concerning this program or any other    �');
  writeln('�  part of Sound Deluxe System, please contact me:                �');
  writeln('�  � Maple Leaf (a.k.a. Gruian Radu)                              �');
  writeln('�  � str.Lunii, nr.22, ap.4, Cluj Napoca, 3400, Rom긪ia           �');
  writeln('�  � Phone: 040 64 124260                                         �');
  writeln('�  � e-Mail: maple_leaf_@hotmail.com, or                          �');
  writeln('�            lsmm@hercule.utcluj.ro (w/ mention "pt. Maple Leaf") �');
  writeln('읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�');
  writeln;

  if paramcount=0 then begin
    writeln('Usage: M2SDM <modulename.ext>');
    writeln('where <modulename> is the name of a file of one of the module types specified');
    writeln('above, and ''ext'' is its extension.');
    writeln('The file is automatically converted into <filename.SDM>');
    halt;
  end;

  writeln('Loading module ...');
  UseUMB:=true;
  UseEMS:=true;  { try to use EMS, if not found then try to use UMB }
  UseGUS:=false; { do not use GUS DRAM here }
  userroutine:=nil;
  module:=sds_load(paramstr(1),true);

  if loaderror<>0 then begin
    writeln('Error loading module: ',#13#10,message[loaderror]);
    halt
  end;

  writeln('Converting to SDM ...');
  if not sds_save_sdm(module, onlydir(paramstr(1))+onlyname(paramstr(1))+'.SDM') then
    writeln('Saving error, code = ',saveerror);

  writeln('Unloading module ...');
  sds_unload(module);

  if loaderror<>0 then writeln('Deallocation error.');
end.
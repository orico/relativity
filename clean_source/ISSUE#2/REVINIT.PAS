unit revinit;

interface
uses  revconst,revrad;

Procedure InitAvail;
Procedure InitMusic;
Procedure InitSubScreen;
Procedure InitKey(speed:byte);
Procedure InitRadVol;
Procedure InitTag;

implementation

Procedure InitTag;
var i:integer;
begin
     for i:= 1 to 18 do
     begin
          tag[i]:=[];
     end;
end;

Procedure InitRadVol;
begin
     vol:=62;
     radvolume(vol);
     volu:=true;
end;


Procedure InitKey(speed:byte);
begin
Port[$60]:=$F3;
Port[$60]:=speed;
end;

{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
(****************************************************************************)
(* Reserved Words - Init Sub Files                                          *)
(****************************************************************************)

Procedure InitAvail;
begin
notavhelp:=[3,4,5,6,7,8];
notavarr[19]:=[7,8,10,13,14,15];
notavarr[1]:=[];
notavarr[2]:=[];
notavarr[3]:=[];
notavarr[4]:=[];
notavarr[5]:=[];
notavarr[6]:=[];
notavarr[7]:=[];
notavarr[8]:=[];
notavarr[9]:=[];
notavarr[10]:=[];
notavarr[11]:=[];
notavarr[12]:=[];
notavarr[13]:=[];
notavarr[14]:=[];
notavarr[15]:=[];
notavarr[16]:=[];
notavarr[17]:=[];
notavarr[18]:=[];
end;

Procedure InitMusic;
begin
lastmus:=11;
curmus:=musdef;
music[1,1]:='RASTER';music[1,2]:='RAD';music[1,3]:='Reality/Void';
music[2,1]:='CRYSTAL2';music[2,2]:='RAD';music[2,3]:='Neo SoftWare';
music[3,1]:='HANGOVER';music[3,2]:='RAD';music[3,3]:='Reality/Void';
music[4,1]:='HUBBARD';music[4,2]:='RAD'; music[4,3]:='Neo SoftWare';
music[5,1]:='NEOINTRO';music[5,2]:='RAD';music[5,3]:='Neo SoftWare';
music[6,1]:='ALLOYRUN';music[6,2]:='RAD';music[6,3]:='Reality/Void';
music[7,1]:='1';music[7,2]:='HSC';music[7,3]:='Neo SoftWare';
music[8,1]:='ZM2';music[8,2]:='HSC';music[8,3]:='DeadKrew';
music[9,1]:='SMJOOP';music[9,2]:='RAD';music[9,3]:='Neo SoftWare';
music[10,1]:='TERRANIA';music[10,2]:='RAD';music[10,3]:='Reality/Void';
music[11,1]:='INTRO';music[11,2]:='HSC';music[11,3]:='Reality/Void';
music[12,1]:='3';music[12,2]:='HSC';music[12,3]:='Neo SoftWare';
music[13,1]:='4';music[13,2]:='HSC';music[13,3]:='Neo SoftWare';
music[14,1]:='5';music[14,2]:='HSC';music[14,3]:='Neo SoftWare';
music[15,1]:='6';music[15,2]:='HSC';music[15,3]:='Neo SoftWare';
music[16,1]:='7';music[16,2]:='HSC';music[16,3]:='Neo SoftWare';
music[17,1]:='8';music[17,2]:='HSC';music[17,3]:='Neo SoftWare';
music[18,1]:='9';music[18,2]:='HSC';music[18,3]:='Neo SoftWare';
music[19,1]:='2';music[19,2]:='HSC';music[19,3]:='Neo SoftWare';
InstallRADTimer;
end;

Procedure InitSubScreen;
var subtemp:sub;
begin
getsubtopics(subscreen[19],subtemp,'mainm');
getsubtopics(subscreen[1],subfile[1],'intro');
getsubtopics(subscreen[2],subfile[2],'insid');
getsubtopics(subscreen[3],subfile[3],'artic');
getsubtopics(subscreen[4],subfile[4],'misc');
getsubtopics(subscreen[5],subfile[5],'revie');
getsubtopics(subscreen[6],subfile[6],'inter');
getsubtopics(subscreen[7],subfile[7],'scene');
getsubtopics(subscreen[8],subfile[8],'highs');
{getsubtopics(subscreen[9],subfile[9],'9'); 9 is group nfos}
getsubtopics(subscreen[10],subfile[10],'top10');
{getsubtopics(subscreen[11],subfile[11],'11'); 11 is game }
getsubtopics(subscreen[12],subfile[12],'secre');
{getsubtopics(subscreen[13],subfile[13],'gques');
getsubtopics(subscreen[14],subfile[14],'pques');}
{getsubtopics(subscreen[15],subfile[16],'16'); 16 is survay }
getsubtopics(subscreen[16],subfile[16],'jobsz');
getsubtopics(subscreen[17],subfile[17],'relat');
helpmenu:=help_menu;
end;

end.
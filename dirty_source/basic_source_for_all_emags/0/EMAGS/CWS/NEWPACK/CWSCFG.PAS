program revcfg;
uses revconst,revtech,revinit,revpoint,crt;
var cfg_file: file of configure;
const
    help_menu : hlp =
   ('� Font          ',
    '� Smooth Scroll ',
    '� Mr Rodent     ',
    '� Random Music  ',
    '� Voc Support   ',
    '� Save As Text  ',
    '� Brightness    ',
    '� Exit Help     ');

var i,j : integer;
var subtemp:sub;
begin
    initconfigpointer;
    config^.y2:=16;
    config^.x2:=19;
    config^.colbacksec2:=magenta;
    config^.colformain2:=yellow;
    config^.y1:=16;
    config^.x1:=19;
    config^.colbacksec1:=yellow;
    config^.colformain1:=magenta;
    config^.defsavefile:='CWS98-07.REV';
    config^.fntdef:=13;
    config^.radmusdef:=6;
    config^.dsmmusdef:=22;
    config^.pass_section:=0;
    config^.game_section:=16;
    config^.cfg_file:=cfg_name; {DONE}
    config^.init:='HARDWARE.BIN'; {DONE}
    config^.longfile:='REVLONG.BIN'; {DONE}
    config^.long:=false; {DONE}
    config^.fli:=false; {DONE}
    config^.password:=''; {DONE}
    config^.disc:='DISC.BIN'; {DONE}
    config^.psMenuFile:=''; {DONE}
    config^.hpMenuFile:='REVHELP.BIN';{DONE}
    config^.bmMenuFile:='REVBOOM.BIN';{DONE}
    config^.DefMenuFile:='MAINMENU.BIN';{DONE}
    config^.SecMenuFile:='MAINMENMU.BIN'; {DONE}
    config^.TrdMenuFile:=''; {DONE}
    config^.EndMenuFile:='END.BIN';  {DONE}
    config^.EndMenuFlag:=false;  {DONE}
    config^.EndMenuFile2:='.BIN'; {DONE}
    config^.dolby_pic:='DOLBY.GIF';{} {DONE ISSUE 6}
    config^.intro[1]:='INTRO.GIF';
    config^.intro[2]:='';
    config^.under_pic:='UNDER.GIF';
    config^.passgif:='';  {}
    config^.outro[1]:='';
    config^.outro[2]:='';
    config^.muscfgfile:='MUSMEN.BIN';
    config^.vocs[1]:='BLOW.VOC';
    config^.vocs[2]:='BLOW2.VOC';
    config^.vocs[3]:='BLOW3.VOC';
    config^.vocs[4]:='AON.VOC';
    config^.vocs[5]:='AOFF.VOC';
    config^.vocs[6]:='HON.VOC';
    config^.vocs[7]:='HOFF.VOC';
    config^.vocs[8]:='OON.VOC';
    config^.vocs[9]:='OOFF.VOC';
    config^.vocs[10]:='SCREAM1.VOC';
    config^.vocs[11]:='SCREAM2.VOC';
    config^.vocs[12]:='SCREAM3.VOC';
    config^.vocs[13]:='AWARNING.VOC';
    config^.vocs[14]:='HWARNING.VOC';
    config^.vocs[15]:='OWARNING.VOC';
    config^.vocs[16]:='OK.VOC';
    config^.vocs[17]:='OK2.VOC';
    config^.vocs[18]:='OK3.VOC';
    config^.vocs[19]:='FONT.VOC';
    config^.vocs[20]:='INTRO.VOC';
    config^.vocs[21]:='NOW.VOC';
    config^.vocs[22]:='CRUMBLE.VOC';
    config^.vocs[23]:='.VOC';
    config^.vocs[24]:='.VOC';
    config^.vocs[25]:='.VOC';
{-------}
     for i:= 1 to 19 do
     begin
     config^.tag[i]:=[];
     config^.notavarr[i]:=[];
     end;
     config^.notavarr[19]:=[];
     config^.notavarr[1]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[2]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[3]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[4]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[5]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[6]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[7]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[8]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[9]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[10]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[12]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[13]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[14]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[15]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[16]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
     config^.notavarr[17]:=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];{app}
{-------}
InitBright;
InitFonts;
InitMusic;
config^.help_menu:=help_menu;

assign(cfg_file,CONFIG^.CFG_FILE);
rewrite(cfg_file);

for i:= 1 to 18 do
    for j:= 1 to 18 do
    begin
        config^.subfile[i][j]:='';
        config^.subscreen[i][j]:='';
    end;
{main menu}
config^.subscreen[19][1]:='� Introductions       ';config^.subfile[19][1]:='SEC1.BIN';
config^.subscreen[19][2]:='� Scene Wide Top 50   ';config^.subfile[19][2]:='SEC2.BIN';
config^.subscreen[19][3]:='� World''s Top 25      ';config^.subfile[19][3]:='SEC3.BIN';
config^.subscreen[19][4]:='� Zero Sec Top 50     ';config^.subfile[19][4]:='SEC4.BIN';
config^.subscreen[19][5]:='� CwS Site Chart      ';config^.subfile[19][5]:='SEC5.BIN';
config^.subscreen[19][6]:='� CwS Group Stats     ';config^.subfile[19][6]:='SEC6.BIN';
config^.subscreen[19][7]:='� Scene News #1       ';config^.subfile[19][7]:='SEC7.BIN';
config^.subscreen[19][8]:='� Scene News #2       ';config^.subfile[19][8]:='SEC8.BIN';
config^.subscreen[19][9]:='� Scene News #3       ';config^.subfile[19][9]:='SEC9.BIN';
config^.subscreen[19][10]:='� Scene Total Pts     ';config^.subfile[19][10]:='SEC10.BIN';
config^.subscreen[19][11]:='� World''s Total Pts   ';config^.subfile[19][11]:='SEC11.BIN';
config^.subscreen[19][12]:='� Zero Sec Total Pts  ';config^.subfile[19][12]:='SEC12.BIN';
config^.subscreen[19][13]:='� CwS Help/Rules      ';config^.subfile[19][13]:='SEC13.BIN';
config^.subscreen[19][14]:='� Special Report      ';config^.subfile[19][14]:='SEC14.BIN';
config^.subscreen[19][15]:='�  Whats New / Greets ';config^.subfile[19][15]:='SEC15.BIN';
config^.subscreen[19][16]:='� Arkanoid The Game   ';config^.subfile[19][16]:='';
config^.subscreen[19][17]:='� #Emags..MUST READ ! ';config^.subfile[19][17]:='EMAGS.BIN';
config^.subscreen[19][18]:='� Conclusion          ';config^.subfile[19][18]:='';
{hard and software .. or alone , }
{intro}
config^.subscreen[1][1]:='� Introduction        ';config^.subfile[1][1]:='ENKRYPT.BIN';
config^.subscreen[1][2]:='� MuadDIb Speaks      ';config^.subfile[1][2]:='MUADDIB.BIN';
config^.subscreen[1][3]:='� Past Passwords      ';config^.subfile[1][3]:='PASSWORD.BIN';
config^.subscreen[1][4]:='� ------------------- ';config^.subfile[1][4]:='';
config^.subscreen[1][5]:='� ------------------- ';config^.subfile[1][5]:='';
config^.subscreen[1][6]:='� ------------------- ';config^.subfile[1][6]:='';
config^.subscreen[1][7]:='� ------------------- ';config^.subfile[1][7]:='';
config^.subscreen[1][8]:='� ------------------- ';config^.subfile[1][8]:='';
config^.subscreen[1][9]:='� ------------------- ';config^.subfile[1][9]:='';
config^.subscreen[1][10]:='� ------------------- ';config^.subfile[1][10]:='';
config^.subscreen[1][11]:='� ------------------- ';config^.subfile[1][11]:='';
config^.subscreen[1][12]:='� ------------------- ';config^.subfile[1][12]:='';
config^.subscreen[1][13]:='� ------------------- ';config^.subfile[1][13]:='';
config^.subscreen[1][14]:='� ------------------- ';config^.subfile[1][14]:='';
config^.subscreen[1][15]:='� ------------------- ';config^.subfile[1][15]:='';
config^.subscreen[1][16]:='� ------------------- ';config^.subfile[1][16]:='';
config^.subscreen[1][17]:='� ------------------- ';config^.subfile[1][17]:='';
config^.subscreen[1][18]:='� Exit To Main        ';config^.subfile[1][18]:='';
i:=2;
config^.subscreen[i][1]:='� "I''m Just lame.."   ';config^.subfile[i][1]:='sCENE01.BIN';
config^.subscreen[i][2]:='� Inter W/ ^DuctMan^  ';config^.subfile[i][2]:='SCENE02.BIN';
config^.subscreen[i][3]:='� The changing ...    ';config^.subfile[i][3]:='SCENE03.BIN';
config^.subscreen[i][4]:='� Inter W/sextronix   ';config^.subfile[i][4]:='SCENE04.BIN';
config^.subscreen[i][5]:='� Internet vs. BBS''s  ';config^.subfile[i][5]:='SCENE05.BIN';
config^.subscreen[i][6]:='� Scene Friendship    ';config^.subfile[i][6]:='SCENE06.BIN';
config^.subscreen[i][7]:='� Old Warez Dayz      ';config^.subfile[i][7]:='SCENE07.BIN';
config^.subscreen[i][8]:='� Lame Ass Nukers     ';config^.subfile[i][8]:='SCENE08.BIN';
config^.subscreen[i][9]:='� ------------------- ';config^.subfile[i][9]:='.BIN';
config^.subscreen[i][10]:='� ------------------- ';config^.subfile[i][10]:='.BIN';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='.BIN';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='.BIN';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='.BIN';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='.BIN';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='.BIN';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='.BIN';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='.BIN';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='.BIN';
i:=3;
config^.subscreen[i][1]:='� NEiL/FLT            ';config^.subfile[i][1]:='OLD01.BIN';
config^.subscreen[i][2]:='� LordByron           ';config^.subfile[i][2]:='OLD02.BIN';
config^.subscreen[i][3]:='� Theprofil           ';config^.subfile[i][3]:='OLD03.BIN';
config^.subscreen[i][4]:='� TRISTAR & REDSECTOR ';config^.subfile[i][4]:='OLD04.BIN';
config^.subscreen[i][5]:='� ------------------- ';config^.subfile[i][5]:='';
config^.subscreen[i][6]:='� ------------------- ';config^.subfile[i][6]:='';
config^.subscreen[i][7]:='� ------------------- ';config^.subfile[i][7]:='';
config^.subscreen[i][8]:='� ------------------- ';config^.subfile[i][8]:='';
config^.subscreen[i][9]:='� ------------------- ';config^.subfile[i][9]:='';
config^.subscreen[i][10]:='� ------------------- ';config^.subfile[i][10]:='';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='';
i:=4;
config^.subscreen[i][1]:='� Year of the Beast   ';config^.subfile[i][1]:='MISC01.BIN';
config^.subscreen[i][2]:='� Guide to Safe Sex   ';config^.subfile[i][2]:='MISC02.BIN';
config^.subscreen[i][3]:='� Inet Addicts Test   ';config^.subfile[i][3]:='MISC03.BIN';
config^.subscreen[i][4]:='� Famous Last Words   ';config^.subfile[i][4]:='MISC04.BIN';
config^.subscreen[i][5]:='� X-mas in the Hood   ';config^.subfile[i][5]:='MISC05.BIN';
config^.subscreen[i][6]:='� Puters Male,Female? ';config^.subfile[i][6]:='MISC06.BIN';
config^.subscreen[i][7]:='� Rich Gates          ';config^.subfile[i][7]:='MISC07.BIN';
config^.subscreen[i][8]:='� Fun With Barbie     ';config^.subfile[i][8]:='MISC08.BIN';
config^.subscreen[i][9]:='� Diary of Aol User   ';config^.subfile[i][9]:='MISC09.BIN';
config^.subscreen[i][10]:='� 30 things in a car  ';config^.subfile[i][10]:='MISC10.BIN';
config^.subscreen[i][11]:='� Jokes               ';config^.subfile[i][11]:='MISC11.BIN';
config^.subscreen[i][12]:='� Death               ';config^.subfile[i][12]:='MISC12.BIN';
config^.subscreen[i][13]:='� Bad Isp ?           ';config^.subfile[i][13]:='MISC13.BIN';
config^.subscreen[i][14]:='� Your Ghetto         ';config^.subfile[i][14]:='MISC14.BIN';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='.BIN';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='.BIN';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='.BIN';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='.BIN';
{relativity}
i:=5;
config^.subscreen[i][1]:='� Believe Me !!!!     ';config^.subfile[i][1]:='REV01.BIN';
config^.subscreen[i][2]:='� Believe Me 2 !!!!!  ';config^.subfile[i][2]:='REV02.BIN';
config^.subscreen[i][3]:='� The Fcc (whatever)  ';config^.subfile[i][3]:='REV03.BIN';
config^.subscreen[i][4]:='� Relativity''s Faq    ';config^.subfile[i][4]:='REVFAQ.BIN';
config^.subscreen[i][5]:='� Relativity''s NFO    ';config^.subfile[i][5]:='REVNFO.BIN';
config^.subscreen[i][6]:='� Relativity''s App    ';config^.subfile[i][6]:='REVAPP.BIN';
config^.subscreen[i][7]:='� Writer Instructions ';config^.subfile[i][7]:='WRITERS.BIN';
config^.subscreen[i][8]:='� Thanks To .....      ';config^.subfile[i][8]:='THANKS.BIN';
config^.subscreen[i][9]:='� ------------------- ';config^.subfile[i][9]:='.BIN';
config^.subscreen[i][10]:='� ------------------- ';config^.subfile[i][10]:='.BIN';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='.BIN';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='.BIN';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='.BIN';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='.BIN';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='.BIN';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='.BIN';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='.BIN';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='.BIN';
i:=6;{terror}
config^.subscreen[i][1]:='� Sodium Bomb         ';config^.subfile[i][1]:='TERROR01.BIN';
config^.subscreen[i][2]:='� School Puters       ';config^.subfile[i][2]:='TERROR02.BIN';
config^.subscreen[i][3]:='� Neighbour Hell 1    ';config^.subfile[i][3]:='TERROR03.BIN';
config^.subscreen[i][4]:='� Neighbour Hell 2    ';config^.subfile[i][4]:='TERROR04.BIN';
config^.subscreen[i][5]:='� Flame Thrower       ';config^.subfile[i][5]:='TERROR05.BIN';
config^.subscreen[i][6]:='� Things              ';config^.subfile[i][6]:='TERROR06.BIN';
config^.subscreen[i][7]:='� Pissing Food Outlet ';config^.subfile[i][7]:='TERROR07.BIN';
config^.subscreen[i][8]:='� Cocktail Bomb       ';config^.subfile[i][8]:='TERROR08.BIN';
config^.subscreen[i][9]:='� Soda Bomb           ';config^.subfile[i][9]:='TERROR09.BIN';
config^.subscreen[i][10]:='� Ingredients         ';config^.subfile[i][10]:='TERROR10.BIN';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='';
i:=7;{Woman's}
config^.subscreen[i][1]:='� Rulez of Relations  ';config^.subfile[i][1]:='WOMAN01.BIN';
config^.subscreen[i][2]:='� Jokes               ';config^.subfile[i][2]:='WOMAN02.BIN';
config^.subscreen[i][3]:='� LoveMaker 3.1v      ';config^.subfile[i][3]:='WOMAN03.BIN';
config^.subscreen[i][4]:='� ------------------- ';config^.subfile[i][4]:='.BIN';
config^.subscreen[i][5]:='� ------------------- ';config^.subfile[i][5]:='.BIN';
config^.subscreen[i][6]:='� ------------------- ';config^.subfile[i][6]:='.BIN';
config^.subscreen[i][7]:='� ------------------- ';config^.subfile[i][7]:='.BIN';
config^.subscreen[i][8]:='� ------------------- ';config^.subfile[i][8]:='.BIN';
config^.subscreen[i][9]:='� ------------------- ';config^.subfile[i][9]:='.BIN';
config^.subscreen[i][10]:='� ------------------- ';config^.subfile[i][10]:='.BIN';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='.BIN';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='.BIN';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='.BIN';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='.BIN';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='.BIN';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='.BIN';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='.BIN';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='.BIN';
i:=8;{muisc}
config^.subscreen[i][1]:='� Nana - Lonely       ';config^.subfile[i][1]:='MUSIC01.BIN';
config^.subscreen[i][2]:='� Offspring''s Concert ';config^.subfile[i][2]:='MUSIC02.BIN';
config^.subscreen[i][3]:='� The Prodigy         ';config^.subfile[i][3]:='MUSIC03.BIN';
config^.subscreen[i][4]:='� Real Audio or Mp3 ? ';config^.subfile[i][4]:='MUSIC04.BIN';
config^.subscreen[i][5]:='� UNDERGROUND SOUNDS  ';config^.subfile[i][5]:='MUSIC05.BIN';
config^.subscreen[i][6]:='� -------------------- ';config^.subfile[i][6]:='.BIN';
config^.subscreen[i][7]:='� -------------------- ';config^.subfile[i][7]:='.BIN';
config^.subscreen[i][8]:='� -------------------- ';config^.subfile[i][8]:='.BIN';
config^.subscreen[i][9]:='� -------------------- ';config^.subfile[i][9]:='.BIN';
config^.subscreen[i][10]:='� ------------------- ';config^.subfile[i][10]:='.BIN';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='.BIN';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='.BIN';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='.BIN';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='.BIN';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='.BIN';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='.BIN';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='.BIN';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='.BIN';
i:=9;{Coding}
config^.subscreen[i][1]:='� Hacking Pop3        ';config^.subfile[i][1]:='CODE01.BIN';
config^.subscreen[i][2]:='� Menu in Pascal      ';config^.subfile[i][2]:='CODE02.BIN';
config^.subscreen[i][3]:='� ------------------- ';config^.subfile[i][3]:='.BIN';
config^.subscreen[i][4]:='� ------------------- ';config^.subfile[i][4]:='.BIN';
config^.subscreen[i][5]:='� ------------------- ';config^.subfile[i][5]:='.BIN';
config^.subscreen[i][6]:='� ------------------- ';config^.subfile[i][6]:='.BIN';
config^.subscreen[i][7]:='� ------------------- ';config^.subfile[i][7]:='.BIN';
config^.subscreen[i][8]:='� ------------------- ';config^.subfile[i][8]:='.BIN';
config^.subscreen[i][9]:='� ------------------- ';config^.subfile[i][9]:='.BIN';
config^.subscreen[i][10]:='� ------------------- ';config^.subfile[i][10]:='.BIN';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='.BIN';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='.BIN';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='.BIN';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='.BIN';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='.BIN';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='.BIN';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='.BIN';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='.BIN';
i:=10;{VGA}
config^.subscreen[i][1]:='� ENKRYPT #1          ';config^.subfile[i][1]:='ART01.GIF';
config^.subscreen[i][2]:='� ^AcMe^ #1           ';config^.subfile[i][2]:='ART02.GIF';
config^.subscreen[i][3]:='� Keiser Soze #1      ';config^.subfile[i][3]:='ART03.GIF';
config^.subscreen[i][4]:='� Sir Magik #1        ';config^.subfile[i][4]:='ART04.GIF';
config^.subscreen[i][5]:='� UnKnown #1          ';config^.subfile[i][5]:='ART05.GIF';
config^.subscreen[i][6]:='� STAR #1000          ';config^.subfile[i][6]:='ART06.GIF';
config^.subscreen[i][7]:='� STAR #1001          ';config^.subfile[i][7]:='ART07.GIF';
config^.subscreen[i][8]:='� MOZ #1              ';config^.subfile[i][8]:='ART08.GIF';
config^.subscreen[i][9]:='� PU69Y #1            ';config^.subfile[i][9]:='ART09.GIF';
config^.subscreen[i][10]:='� STAR #1002          ';config^.subfile[i][10]:='ART10.GIF';
config^.subscreen[i][11]:='� STAR #1003          ';config^.subfile[i][11]:='ART11.GIF';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='';
i:=11; {Game}
config^.subscreen[i][1]:='� REVIMAGE #1         ';config^.subfile[i][1]:='ART00.GIF';
config^.subscreen[i][2]:='� REVIMAGE #2         ';config^.subfile[i][2]:='ART01.GIF';
config^.subscreen[i][3]:='� REVIMAGE #3         ';config^.subfile[i][3]:='ART02.GIF';
config^.subscreen[i][4]:='� REVIMAGE #4         ';config^.subfile[i][4]:='ART04.GIF';
config^.subscreen[i][5]:='� REVIMAGE #5         ';config^.subfile[i][5]:='ART05.GIF';
config^.subscreen[i][6]:='� REVIMAGE #6         ';config^.subfile[i][6]:='ART06.GIF';
config^.subscreen[i][7]:='� REVIMAGE #7         ';config^.subfile[i][7]:='ART07.GIF';
config^.subscreen[i][8]:='� REVIMAGE #8         ';config^.subfile[i][8]:='ART08.GIF';
config^.subscreen[i][9]:='� REVIMAGE #9         ';config^.subfile[i][9]:='ART09.GIF';
config^.subscreen[i][10]:='� REVIMAGE #10         ';config^.subfile[i][10]:='ART10.GIF';
config^.subscreen[i][11]:='� REVIMAGE #11         ';config^.subfile[i][11]:='ART11.GIF';
config^.subscreen[i][12]:='� REVIMAGE #12         ';config^.subfile[i][12]:='ART12.GIF';
config^.subscreen[i][13]:='� REVIMAGE #13         ';config^.subfile[i][13]:='ART13.GIF';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='';
i:=12;{RAZOR}
config^.subscreen[i][1]:='� THE PUNISHER RESIGN ';config^.subfile[i][1]:='RAZOR01.BIN';
config^.subscreen[i][2]:='� PITBULL REPLIES     ';config^.subfile[i][2]:='RAZOR02.BIN';
config^.subscreen[i][3]:='� THIRD SON REPLIES   ';config^.subfile[i][3]:='RAZOR03.BIN';
config^.subscreen[i][4]:='� TSR REPLIES         ';config^.subfile[i][4]:='RAZOR04.BIN';
config^.subscreen[i][5]:='� ------------------- ';config^.subfile[i][5]:='.BIN';
config^.subscreen[i][6]:='� ------------------- ';config^.subfile[i][6]:='.BIN';
config^.subscreen[i][7]:='� ------------------- ';config^.subfile[i][7]:='.BIN';
config^.subscreen[i][8]:='� ------------------- ';config^.subfile[i][8]:='.BIN';
config^.subscreen[i][9]:='� ------------------- ';config^.subfile[i][9]:='';
config^.subscreen[i][10]:='� ------------------- ';config^.subfile[i][10]:='';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='';
i:=13;{SECRET}
config^.subscreen[i][1]:='� Biskit''s            ';config^.subfile[i][1]:='SECRET01.BIN';
config^.subscreen[i][2]:='� ------------------- ';config^.subfile[i][2]:='.BIN';
config^.subscreen[i][3]:='� ------------------- ';config^.subfile[i][3]:='.BIN';
config^.subscreen[i][4]:='� ------------------- ';config^.subfile[i][4]:='.BIN';
config^.subscreen[i][5]:='� ------------------- ';config^.subfile[i][5]:='.BIN';
config^.subscreen[i][6]:='� ------------------- ';config^.subfile[i][6]:='.BIN';
config^.subscreen[i][7]:='� ------------------- ';config^.subfile[i][7]:='.BIN';
config^.subscreen[i][8]:='� ------------------- ';config^.subfile[i][8]:='.BIN';
config^.subscreen[i][9]:='� ------------------- ';config^.subfile[i][9]:='.BIN';
config^.subscreen[i][10]:='� ------------------- ';config^.subfile[i][10]:='.BIN';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='.BIN';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='.BIN';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='.BIN';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='.BIN';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='.BIN';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='.BIN';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='.BIN';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='.BIN';
i:=14;{10}
config^.subscreen[i][1]:='� Top 10 Sites        ';config^.subfile[i][1]:='10SITES.BIN';
config^.subscreen[i][2]:='� Top 10 Couriers     ';config^.subfile[i][2]:='10COUR.BIN';
config^.subscreen[i][3]:='� Top 10 ALL Groups   ';config^.subfile[i][3]:='10ALLGRP.BIN';
config^.subscreen[i][4]:='� Top 10 Groups       ';config^.subfile[i][4]:='10GROUPS.BIN';
config^.subscreen[i][5]:='� Top 10 of Sites     ';config^.subfile[i][5]:='SITES.BIN';
config^.subscreen[i][6]:='� ------------------- ';config^.subfile[i][6]:='.BIN';
config^.subscreen[i][7]:='� ------------------- ';config^.subfile[i][7]:='.BIN';
config^.subscreen[i][8]:='� ------------------- ';config^.subfile[i][8]:='.BIN';
config^.subscreen[i][9]:='� ------------------- ';config^.subfile[i][9]:='.BIN';
config^.subscreen[i][10]:='� ------------------- ';config^.subfile[i][10]:='.BIN';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='.BIN';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='.BIN';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='.BIN';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='.BIN';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='.BIN';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='.BIN';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='.BIN';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='.BIN';
i:=15;{Game Reviews}
config^.subscreen[i][1]:='� Ms - Gaming Zone    ';config^.subfile[i][1]:='REVIEW01.BIN';
config^.subscreen[i][2]:='� Quake 2             ';config^.subfile[i][2]:='REVIEW02.BIN';
config^.subscreen[i][3]:='� Worms 2             ';config^.subfile[i][3]:='REVIEW03.BIN';
config^.subscreen[i][4]:='� Age of Empire       ';config^.subfile[i][4]:='REVIEW04.BIN';
config^.subscreen[i][5]:='� Final Fantasy 7     ';config^.subfile[i][5]:='REVIEW05.BIN';
config^.subscreen[i][6]:='� ------------------- ';config^.subfile[i][6]:='.BIN';
config^.subscreen[i][7]:='� ------------------- ';config^.subfile[i][7]:='.BIN';
config^.subscreen[i][8]:='� ------------------- ';config^.subfile[i][8]:='.BIN';
config^.subscreen[i][9]:='� ------------------- ';config^.subfile[i][9]:='.BIN';
config^.subscreen[i][10]:='� ------------------- ';config^.subfile[i][10]:='.BIN';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='.BIN';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='.BIN';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='.BIN';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='.BIN';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='.BIN';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='.BIN';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='.BIN';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='.BIN';
i:=16;{Stupid}
config^.subscreen[i][1]:='� Dumbest Acts        ';config^.subfile[i][1]:='STUPID01.BIN';
config^.subscreen[i][2]:='� The Theory of ReV   ';config^.subfile[i][2]:='STUPID02.BIN';
config^.subscreen[i][3]:='� Weird Opcodes       ';config^.subfile[i][3]:='STUPID03.BIN';
config^.subscreen[i][4]:='� ------------------- ';config^.subfile[i][4]:='.BIN';
config^.subscreen[i][5]:='� ------------------- ';config^.subfile[i][5]:='.BIN';
config^.subscreen[i][6]:='� ------------------- ';config^.subfile[i][6]:='.BIN';
config^.subscreen[i][7]:='� ------------------- ';config^.subfile[i][7]:='.BIN';
config^.subscreen[i][8]:='� ------------------- ';config^.subfile[i][8]:='.BIN';
config^.subscreen[i][9]:='� ------------------- ';config^.subfile[i][9]:='.BIN';
config^.subscreen[i][10]:='� ------------------- ';config^.subfile[i][10]:='.BIN';
config^.subscreen[i][11]:='� ------------------- ';config^.subfile[i][11]:='.BIN';
config^.subscreen[i][12]:='� ------------------- ';config^.subfile[i][12]:='.BIN';
config^.subscreen[i][13]:='� ------------------- ';config^.subfile[i][13]:='.BIN';
config^.subscreen[i][14]:='� ------------------- ';config^.subfile[i][14]:='.BIN';
config^.subscreen[i][15]:='� ------------------- ';config^.subfile[i][15]:='.BIN';
config^.subscreen[i][16]:='� ------------------- ';config^.subfile[i][16]:='.BIN';
config^.subscreen[i][17]:='� ------------------- ';config^.subfile[i][17]:='.BIN';
config^.subscreen[i][18]:='� Exit To Main        ';config^.subfile[i][18]:='.BIN';
i:=17;{jobs}
config^.subscreen[i][1]:='� ----Relativity ---- ';
config^.subscreen[i][2]:='� ------------------- ';
config^.subscreen[i][3]:='� ---- Positions ---- ';
config^.subscreen[i][4]:='� ------------------- ';
config^.subscreen[i][5]:='� 1) Ansi Artists     ';
config^.subscreen[i][6]:='� 2) Vga Artists      ';
config^.subscreen[i][7]:='� 3) Bot Masters      ';
config^.subscreen[i][8]:='� 4) Writers          ';
config^.subscreen[i][9]:='� ------------------- ';
config^.subscreen[i][10]:='� ------------------- ';
config^.subscreen[i][11]:='� ------------------- ';
config^.subscreen[i][12]:='� ------------------- ';
config^.subscreen[i][13]:='� If you think you can';
config^.subscreen[i][14]:='�  help us out in any ';
config^.subscreen[i][15]:='�   way, contact us!  ';
config^.subscreen[i][16]:='� ------------------- ';
config^.subscreen[i][17]:='� ------------------- ';
config^.subscreen[i][18]:='� Exit To Main        ';
write(cfg_file,config^);
close(cfg_file);
KillConfigPointer;
end.
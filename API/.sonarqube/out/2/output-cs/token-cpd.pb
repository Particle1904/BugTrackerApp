�
#E:\dev\BugTrackerApp\api\Program.cs
var 
builder 
= 
WebApplication 
. 

(* +
args+ /
)/ 0
;0 1
builder

 
.

 
Services

 
.

 
AddDbContext

 
<

 
SqliteDbContext

 -
>

- .
(

. /
options

/ 6
=>

7 9
options

: A
.

A B
	UseSqlite

B K
(

K L
builder

L S
.

S T


T a
.

a b
GetConnectionString

b u
(

u v
$str	

v �
)


� �
)


� �
)


� �
;


� �
builder 
. 
Services 
. 
	AddScoped 
< 
IIssuesRepository ,
,, -
IssuesRepository. >
>> ?
(? @
)@ A
;A B
builder 
. 
Services 
. 
	AddScoped 
< 
ObjectMapper '
>' (
(( )
)) *
;* +
builder
.
Services
.
AddControllers
(
)
;
builder 
. 
Services 
. 
AddCors 
( 
options  
=>! #
{ 
options 
. 
AddDefaultPolicy 
( 
builder $
=>% '
{ 
builder 
. 
WithOrigins 
( 
$str 4
,4 5
$str6 M
)M N
.N O
AllowAnyMethodO ]
(] ^
)^ _
._ `
AllowAnyHeader` n
(n o
)o p
;p q
} 
) 
; 
} 
) 
; 
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 

( 
)  
;  !
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if 
( 
app 
. 
Environment 
. 

(! "
)" #
)# $
{ 
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
) 
; 
}   
app!! 
.!! 
UseHttpsRedirection!! 
(!! 
)!! 
;!! 
app"" 
."" 
UseCors"" 
("" 
)"" 
;""
app## 
.## 
UseAuthorization## 
(## 
)## 
;## 
app$$ 
.$$ 
MapControllers$$ 
($$ 
)$$ 
;$$ 
app%% 
.%% 
Run%% 
(%% 
)%% 	
;%%	 
�7
<E:\dev\BugTrackerApp\api\src\Controllers\IssuesController.cs
	namespace 	
API
 
.
src 
. 
Controllers 
{ 
[		 

]		 
[

 
Route

 

(


 
$str

 !
)

! "
]

" #
public 

class 
IssuesController !
:" #

Controller$ .
{ 
private
readonly
IIssuesRepository
_issuesRepository
;
private 
readonly 
ObjectMapper %

;3 4
public 
IssuesController 
(  
IIssuesRepository  1
issuesRepository2 B
,B C
ObjectMapperD P
objectMapperQ ]
)] ^
{ 	
_issuesRepository 
= 
issuesRepository  0
;0 1

= 
objectMapper (
;( )
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
>& '
Create( .
(. /
[/ 0
FromBody0 8
]8 9
IssueDto: B
issueDtoC K
)K L
{ 	
Issue 
issue 
= 

.' (#
MapIssueDtoToIssueModel( ?
(? @
issueDto@ H
)H I
;I J
await 
_issuesRepository #
.# $
CreateAsync$ /
(/ 0
issue0 5
)5 6
;6 7
return 
Ok 
( 
) 
; 
} 	
[   	
HttpGet  	 
(   
$str   6
)  6 7
]  7 8
public!! 
async!! 
Task!! 
<!! 
ActionResult!! &
>!!& '
GetPaginated!!( 4
(!!4 5
int!!5 8
skip!!9 =
=!!> ?
$num!!@ A
,!!A B
int!!C F
take!!G K
=!!L M
$num!!N P
)!!P Q
{"" 	
IEnumerable## 
<## 
Issue## 
>## 
?## 
issues##  &
=##' (
await##) .
_issuesRepository##/ @
.##@ A
GetPaginated##A M
(##M N
skip##N R
,##R S
take##T X
)##X Y
;##Y Z
if%% 
(%% 
issues%% 
==%% 
null%% 
)%% 
{&& 
return'' 
NotFound'' 
(''  
)''  !
;''! "
}(( 
List** 
<** 
IssueDto** 
>** 
	issuesDto** $
=**% &
new**' *
List**+ /
<**/ 0
IssueDto**0 8
>**8 9
(**9 :
)**: ;
;**; <
foreach++ 
(++ 
Issue++ 
issue++  
in++! #
issues++$ *
)++* +
{,, 
if-- 
(-- 
issue-- 
.-- 
	IsDeleted-- #
)--# $
{.. 
continue// 
;// 
}00 
IssueDto11 
mappedIssue11 $
=11% &

.114 5#
MapIssueModelToIssueDto115 L
(11L M
issue11M R
)11R S
;11S T
	issuesDto22 
.22 
Add22 
(22 
mappedIssue22 )
)22) *
;22* +
}33 
return55 
Ok55 
(55 
	issuesDto55 
)55  
;55  !
}66 	
[88 	
HttpGet88	 
(88 
$str88 #
)88# $
]88$ %
public99 
async99 
Task99 
<99 
ActionResult99 &
>99& '
GetIssuesCount99( 6
(996 7
)997 8
{:: 	
return;; 
Ok;; 
(;; 
await;; 
_issuesRepository;; -
.;;- .
GetIssuesCount;;. <
(;;< =
);;= >
);;> ?
;;;? @
}<< 	
[>> 	
HttpGet>>	 
(>> 
$str>> 
)>> 
]>> 
public?? 
async?? 
Task?? 
<?? 
ActionResult?? &
>??& '
GetById??( /
(??/ 0
int??0 3
id??4 6
)??6 7
{@@ 	
IssueAA 
?AA 
issueAA 
=AA 
awaitAA  
_issuesRepositoryAA! 2
.AA2 3
GetByIdAsyncAA3 ?
(AA? @
idAA@ B
)AAB C
;AAC D
ifBB 
(BB 
issueBB 
==BB 
nullBB 
)BB 
{CC 
returnDD 
NotFoundDD 
(DD  
)DD  !
;DD! "
}EE 
ifFF 
(FF 
issueFF 
.FF 
	IsDeletedFF 
)FF  
{GG 
returnHH 
NotFoundHH 
(HH  
)HH  !
;HH! "
}II 
returnKK 
OkKK 
(KK 

.KK# $#
MapIssueModelToIssueDtoKK$ ;
(KK; <
issueKK< A
)KKA B
)KKB C
;KKC D
}LL 	
[NN 	
HttpPutNN	 
(NN 
$strNN 
)NN 
]NN  
publicOO 
asyncOO 
TaskOO 
<OO 
ActionResultOO &
>OO& '
UpdateOO( .
(OO. /
IssueDtoOO/ 7
issueDtoOO8 @
)OO@ A
{PP 	
ifQQ 
(QQ 
issueDtoQQ 
==QQ 
nullQQ  
)QQ  !
{RR 
returnSS 

BadRequestSS !
(SS! "
)SS" #
;SS# $
}TT 
IssueVV 
issueVV 
=VV 

.VV' (#
MapIssueDtoToIssueModelVV( ?
(VV? @
issueDtoVV@ H
)VVH I
;VVI J
awaitXX 
_issuesRepositoryXX #
.XX# $
UpdateAsyncXX$ /
(XX/ 0
issueDtoXX0 8
.XX8 9
IdXX9 ;
,XX; <
issueXX= B
)XXB C
;XXC D
returnZZ 
OkZZ 
(ZZ 
)ZZ 
;ZZ 
}[[ 	
[]] 	

HttpDelete]]	 
(]] 
$str]] !
)]]! "
]]]" #
public^^ 
ActionResult^^ 
Delete^^ "
(^^" #
int^^# &
id^^' )
)^^) *
{__ 	
_issuesRepository`` 
.`` 
Delete`` $
(``$ %
id``% '
)``' (
;``( )
returnbb 
Okbb 
(bb 
)bb 
;bb 
}cc 	
}dd 
}ee 
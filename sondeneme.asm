TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc
.data
tavan byte 32,32,65,32,66,32,67,32,68,32,69,32,70,32,71,32,72,32,73,32,74,10,0
ust byte 32,201,205,203,205,203,205,203,205,203,205,203,205,203,205,203,205,203,205,203,205,187,10
alt byte 32,200,205,202,205,202,205,202,205,202,205,202,205,202,205,202,205,202,205,202,205,188,10
;x1 byte	     48,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,10
;x2 byte      49,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,10
;x3 byte	  	 50,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,10
;x4 byte    	 51,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,10
;x5 byte		52,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,10
;x6 byte		53,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,10
;x7 byte		54,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,10
;x8 byte		55,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,10
;x9 byte		56,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,10
;x10 byte 	    57,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,219,186,10


goster byte   437 dup(219),0
bipci byte 7,0



yardimci byte 0
x_secim byte 0
y_secim byte 0
sayigir byte "Koordinat Giriniz : ",0
mesaj4 byte "Battleship vurdun!!",10,0
mesaj3 byte "Cruiser Vurdun!!",10,0
mesaj2 byte "Destroyer Vurdun!!",10,0
mesaj1 byte "Submarine Vurdun!!",10,0
tebrik byte "Tebrikler hepsini vurdunuz!! Atis Sayiniz : ",0
mesajiska byte "Iskaladin!!",10,0
yazici byte   230 dup(186)
deneme byte 5
tutucu byte 100 dup(0)
x_koor byte 5
y_koor byte 6
carpici byte 0

cruiser_number byte 2
destroyer_number byte 3

bosluk byte 32,0
satir byte 10,0
submarine_number byte 4

mesaj5 byte "Daha Once Vuruldu!!",10,0
mesaj byte 0
sutcount byte 0
gemi_number byte 20 
.code
main PROC
battleship:
mov eax,2
call randomize
call randomrange
cmp eax,1
je battleshipDikey

battleshipYatay:
call randomize
mov eax,10
call randomrange
add eax,2
mov x_koor,al
mov eax,7
call randomrange
add eax,4
mov y_koor,al


mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,4
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al
sub ah,1
movzx esi,ah

mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al

jmp cruiser

battleshipDikey:
call randomize
mov eax,7
call randomrange
add eax,1
mov x_koor,al
call randomize
mov eax,10
call randomrange
add eax,1
mov y_koor,al


mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,4
movzx esi,ah
mov[tutucu+esi],al
add esi,10

mov[tutucu+esi],al
add esi,10

mov[tutucu+esi],al
add esi,10

mov[tutucu+esi],al



cruiser:
movzx eax,cruiser_number
cmp eax,0
je destroyer
mov eax,2


mov eax,2
call randomize
call randomrange
cmp eax,0
je cruiserdikey


cruiserYatay:
mov eax,10
call randomize
call randomrange
add eax,1
mov x_koor,al
mov eax,8
call randomize
call randomrange
add eax,3
mov y_koor,al

;yatay koþullar
cruiseryataykosul1:

mov eax,1
cmp x_koor,al
jne cruiseryataykosul2
mov eax,3
cmp y_koor,al
jne cruiseryataykosul2
mov al,[tutucu+3]
cmp al,0
jne cruiser
mov al, [tutucu+2]
cmp al,0
jne cruiser
mov al,[tutucu+1]
cmp al,0
jne cruiser
mov al,[tutucu]
cmp al,0
jne cruiser

mov al,[tutucu+10]
cmp al,0
jne cruiser
mov al,[tutucu+11]
cmp al,0
jne cruiser
mov al,[tutucu+12]
cmp al,0
jne cruiser
mov al,[tutucu+13]
cmp al,0
jne cruiser

mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al
sub ah,1
movzx esi,ah

mov[tutucu+esi],al



dec cruiser_number
jmp cruiser


;cruiser yatay koþul 2

cruiseryataykosul2:
mov eax,1
cmp x_koor,al
jne cruiseryataykosul3
mov eax,10
cmp y_koor,al
jne cruiseryataykosul3
mov al,[tutucu+9]
cmp al,0
jne cruiser
mov al, [tutucu+8]
cmp al,0
jne cruiser
mov al,[tutucu+7]
cmp al,0
jne cruiser
mov al,[tutucu+6]
cmp al,0
jne cruiser

mov al,[tutucu+19]
cmp al,0
jne cruiser
mov al,[tutucu+18]
cmp al,0
jne cruiser
mov al,[tutucu+17]
cmp al,0
jne cruiser
mov al,[tutucu+16]
cmp al,0
jne cruiser


mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al
sub ah,1
movzx esi,ah

mov[tutucu+esi],al



dec cruiser_number
jmp cruiser

;cruiser yatay koþul 3

cruiseryataykosul3:
mov eax,10
cmp x_koor,al
jne cruiseryataykosul4
mov eax,3
cmp y_koor,al
jne cruiseryataykosul4
mov al,[tutucu+90]
cmp al,0
jne cruiser
mov al, [tutucu+91]
cmp al,0
jne cruiser
mov al,[tutucu+92]
cmp al,0
jne cruiser
mov al,[tutucu+93]
cmp al,0
jne cruiser

mov al,[tutucu+80]
cmp al,0
jne cruiser
mov al,[tutucu+81]
cmp al,0
jne cruiser
mov al,[tutucu+82]
cmp al,0
jne cruiser
mov al,[tutucu+83]
cmp al,0
jne cruiser


mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al
sub ah,1
movzx esi,ah

mov[tutucu+esi],al



dec cruiser_number
jmp cruiser

;cruiser yatay koþul 4

cruiseryataykosul4:
mov eax,10
cmp x_koor,al
jne cruiseryataykosul5
mov eax,10
cmp y_koor,al
jne cruiseryataykosul5
mov al,[tutucu+99]
cmp al,0
jne cruiser
mov al, [tutucu+98]
cmp al,0
jne cruiser
mov al,[tutucu+97]
cmp al,0
jne cruiser
mov al,[tutucu+96]
cmp al,0
jne cruiser

mov al,[tutucu+89]
cmp al,0
jne cruiser
mov al,[tutucu+88]
cmp al,0
jne cruiser
mov al,[tutucu+87]
cmp al,0
jne cruiser
mov al,[tutucu+86]
cmp al,0
jne cruiser


mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al
sub ah,1
movzx esi,ah

mov[tutucu+esi],al



dec cruiser_number
jmp cruiser


;cruiser yatay koþul 5

cruiseryataykosul5:
mov eax,1
cmp x_koor,al
jne cruiseryataykosul6

mov bl,y_koor
sub bl,1

movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser
mov al,[tutucu+esi-3]
cmp al,0
jne cruiser

add bl,10
movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser
mov al,[tutucu+esi-3]
cmp al,0
jne cruiser








mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al
sub ah,1
movzx esi,ah

mov[tutucu+esi],al



dec cruiser_number
jmp cruiser

;cruiser yatay koþul 6

cruiseryataykosul6:
mov eax,10
cmp x_koor,al
jne cruiseryataykosul7

mov bl,y_koor
sub bl,1

add bl,90
movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser
mov al,[tutucu+esi-3]
cmp al,0
jne cruiser

sub bl,10
movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser
mov al,[tutucu+esi-3]
cmp al,0
jne cruiser








mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al
sub ah,1
movzx esi,ah

mov[tutucu+esi],al



dec cruiser_number
jmp cruiser


;cruiser yatay koþul 7

cruiseryataykosul7:
mov eax,10
cmp y_koor,al
jne cruiseryataykosul8

mov al,10
mov bl,x_koor
sub bl,1
mul bl
movzx esi,al



mov al,[tutucu+esi+9]
cmp al,0
jne cruiser
mov al, [tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+7]
cmp al,0
jne cruiser
mov al,[tutucu+esi+6]
cmp al,0
jne cruiser



sub bl,10
sub esi,10

mov al,[tutucu+esi+9]
cmp al,0
jne cruiser
mov al, [tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+7]
cmp al,0
jne cruiser
mov al,[tutucu+esi+6]
cmp al,0
jne cruiser

add bl,20
add esi,20
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser
mov al, [tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+7]
cmp al,0
jne cruiser
mov al,[tutucu+esi+6]
cmp al,0
jne cruiser








mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al
sub ah,1
movzx esi,ah

mov[tutucu+esi],al



dec cruiser_number
jmp cruiser

;cruiser yatay koþul 8

cruiseryataykosul8:
mov eax,3
cmp y_koor,al
jne cruiseryataykosul9

mov al,10
mov bl,x_koor
sub bl,1
mul bl

movzx esi,al


mov al,[tutucu+esi+3]
cmp al,0
jne cruiser
mov al, [tutucu+esi+2]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al,[tutucu+esi+0]
cmp al,0
jne cruiser

add bl,10
add esi,10
mov al,[tutucu+esi+3]
cmp al,0
jne cruiser
mov al, [tutucu+esi+2]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al,[tutucu+esi+0]
cmp al,0
jne cruiser

sub bl,20
sub esi,20

mov al,[tutucu+esi+3]
cmp al,0
jne cruiser
mov al, [tutucu+esi+2]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al,[tutucu+esi+0]
cmp al,0
jne cruiser









mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al
sub ah,1
movzx esi,ah

mov[tutucu+esi],al



dec cruiser_number
jmp cruiser

;cruiser yatay koþul 9

cruiseryataykosul9:


mov al,10
mov bl,x_koor
sub bl,1
mul bl

movzx esi,al
movzx eax,y_koor
add esi,eax

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser
mov al,[tutucu+esi-3]
cmp al,0
jne cruiser
mov al,[tutucu+esi-4]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser
mov al,[tutucu+esi-3]
cmp al,0
jne cruiser
mov al,[tutucu+esi-4]
cmp al,0
jne cruiser

sub bl,20
sub esi,20
mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser
mov al,[tutucu+esi-3]
cmp al,0
jne cruiser
mov al,[tutucu+esi-4]
cmp al,0
jne cruiser









mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al
sub ah,1
movzx esi,ah

mov[tutucu+esi],al



dec cruiser_number
jmp cruiser



;//////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////
;
; CRUISER YATAY SONU
;
;/////////////////////////////////////////////////////////////////////


cruiserdikey:
mov eax,8
call randomize
call randomrange
add eax,3
mov x_koor,al

mov eax,10
call randomize
call randomrange
add eax,1
mov y_koor,al
			
;dikey koþullar
;cruiser dikey koþul 1

cruiserdikeykosul1:
mov eax,3
cmp x_koor,al
jne cruiserdikeykosul2

mov eax,1
cmp y_koor,al
jne cruiserdikeykosul2






mov al,[tutucu]
cmp al,0
jne cruiser

mov al,[tutucu+1]
cmp al,0
jne cruiser

mov al,[tutucu+10]
cmp al,0
jne cruiser

mov al,[tutucu+11]
cmp al,0
jne cruiser

mov al,[tutucu+20]
cmp al,0
jne cruiser

mov al,[tutucu+21]
cmp al,0
jne cruiser

mov al,[tutucu+30]
cmp al,0
jne cruiser

mov al,[tutucu+31]
cmp al,0
jne cruiser








;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al

dec cruiser_number
jmp cruiser



;cruiser yatay koþul 2

;cruiser dikey koþul 2

cruiserdikeykosul2:
mov eax,3
cmp x_koor,al
jne cruiserdikeykosul3

mov eax,10
cmp y_koor,al
jne cruiserdikeykosul3






mov al,[tutucu+8]
cmp al,0
jne cruiser

mov al,[tutucu+9]
cmp al,0
jne cruiser

mov al,[tutucu+18]
cmp al,0
jne cruiser

mov al,[tutucu+19]
cmp al,0
jne cruiser

mov al,[tutucu+28]
cmp al,0
jne cruiser

mov al,[tutucu+29]
cmp al,0
jne cruiser

mov al,[tutucu+38]
cmp al,0
jne cruiser

mov al,[tutucu+39]
cmp al,0
jne cruiser







;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al

dec cruiser_number
jmp cruiser


;cruiser yatay koþul 3

;cruiser dikey koþul 3

cruiserdikeykosul3:
mov eax,10
cmp x_koor,al
jne cruiserdikeykosul4

mov eax,1
cmp y_koor,al
jne cruiserdikeykosul4






mov al,[tutucu+60]
cmp al,0
jne cruiser

mov al,[tutucu+61]
cmp al,0
jne cruiser

mov al,[tutucu+70]
cmp al,0
jne cruiser

mov al,[tutucu+71]
cmp al,0
jne cruiser

mov al,[tutucu+80]
cmp al,0
jne cruiser

mov al,[tutucu+81]
cmp al,0
jne cruiser

mov al,[tutucu+90]
cmp al,0
jne cruiser

mov al,[tutucu+91]
cmp al,0
jne cruiser








;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al

dec cruiser_number
jmp cruiser



;cruiser yatay koþul 4

;cruiser dikey koþul 4

cruiserdikeykosul4:
mov eax,10
cmp x_koor,al
jne cruiserdikeykosul5

mov eax,10
cmp y_koor,al
jne cruiserdikeykosul5






mov al,[tutucu+68]
cmp al,0
jne cruiser

mov al,[tutucu+69]
cmp al,0
jne cruiser

mov al,[tutucu+78]
cmp al,0
jne cruiser

mov al,[tutucu+79]
cmp al,0
jne cruiser

mov al,[tutucu+88]
cmp al,0
jne cruiser

mov al,[tutucu+89]
cmp al,0
jne cruiser

mov al,[tutucu+98]
cmp al,0
jne cruiser

mov al,[tutucu+99]
cmp al,0
jne cruiser








;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al

dec cruiser_number
jmp cruiser



;cruiser yatay koþul 5

;cruiser dikey koþul 5

cruiserdikeykosul5:
mov eax,10
cmp x_koor,al
jne cruiserdikeykosul6

mov bl,y_koor
sub bl,1

movzx esi,bl




mov al,[tutucu+60+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+60+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10
mov al,[tutucu+60+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+60+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi+1]
cmp al,0
jne cruiser





;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al

dec cruiser_number
jmp cruiser


;cruiser yatay koþul 6

;cruiser dikey koþul 6

cruiserdikeykosul6:
mov eax,3
cmp x_koor,al
jne cruiserdikeykosul7

mov bl,y_koor
sub bl,1


movzx esi,bl



mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser





;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al

dec cruiser_number
jmp cruiser




;cruiser yatay koþul 7

;cruiser dikey koþul 7


;burdayým
cruiserdikeykosul7:
mov eax,1
cmp y_koor,al
jne cruiserdikeykosul8

mov bl,x_koor
sub bl,4
mov al,10
mul bl
mov bl,al

movzx esi,bl


mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10
mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser













;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al

dec cruiser_number
jmp cruiser



;cruiser yatay koþul 8

;cruiser dikey koþul 8

cruiserdikeykosul8:
mov eax,10
cmp y_koor,al
jne cruiserdikeykosul9

mov bl,x_koor
sub bl,4
mov al,10
mul bl
mov bl,al
movzx esi,bl

mov al,[tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser

add bl,10
add esi,10


mov al,[tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser















;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al

dec cruiser_number
jmp cruiser





;cruiser yatay koþul 9




;cruiser dikey koþul 9

cruiserdikeykosul9:



mov bl,y_koor
sub bl,1
mov al,10
mov ah,x_koor
sub ah,4
mul ah
mov bh,al
movzx esi,bl
movzx eax,bh
add esi,eax

mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bh,10
add esi,10

mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bh,10
add esi,10
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bh,10
add esi,10
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bh,10
add esi,10
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser



















;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,3
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al

dec cruiser_number
jmp cruiser






;//////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////
;
; CRUISER DIKEY SONU
;
;/////////////////////////////////////////////////////////////////////



destroyer:
movzx eax,destroyer_number
cmp eax,0
je submarine
mov eax,2
call randomize
call randomrange
cmp eax,0
je destroyerdikey

destroyeryatay:
mov eax,10
call randomize
call randomrange
add eax,1
mov x_koor,al
mov eax,9
call randomize
call randomrange
add eax,2
mov y_koor,al
;destroyer yatay 
destroyeryataykosul1:

mov eax,1
cmp x_koor,al
jne destroyeryataykosul2
mov eax,2
cmp y_koor,al
jne destroyeryataykosul2

mov al, [tutucu+2]
cmp al,0
jne cruiser
mov al,[tutucu+1]
cmp al,0
jne cruiser
mov al,[tutucu]
cmp al,0
jne cruiser

mov al,[tutucu+10]
cmp al,0
jne cruiser
mov al,[tutucu+11]
cmp al,0
jne cruiser
mov al,[tutucu+12]
cmp al,0
jne cruiser
;//////////////////////////OK

mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al




dec destroyer_number
jmp destroyer
;/////////////////////////ok

;cruiser yatay koþul 2

destroyeryataykosul2:
mov eax,1
cmp x_koor,al
jne destroyeryataykosul3
mov eax,10
cmp y_koor,al
jne destroyeryataykosul3
mov al,[tutucu+9]
cmp al,0
jne cruiser
mov al, [tutucu+8]
cmp al,0
jne cruiser
mov al,[tutucu+7]
cmp al,0
jne cruiser


mov al,[tutucu+19]
cmp al,0
jne cruiser
mov al,[tutucu+18]
cmp al,0
jne cruiser
mov al,[tutucu+17]
cmp al,0
jne cruiser



mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al




dec destroyer_number
jmp destroyer

;//////////////ok

;cruiser yatay koþul 3

destroyeryataykosul3:
mov eax,10
cmp x_koor,al
jne destroyeryataykosul4
mov eax,2
cmp y_koor,al
jne destroyeryataykosul4
mov al,[tutucu+90]
cmp al,0
jne cruiser
mov al, [tutucu+91]
cmp al,0
jne cruiser
mov al,[tutucu+92]
cmp al,0
jne cruiser


mov al,[tutucu+80]
cmp al,0
jne cruiser
mov al,[tutucu+81]
cmp al,0
jne cruiser
mov al,[tutucu+82]
cmp al,0
jne cruiser



mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al




dec destroyer_number
jmp destroyer
;/////////ok

;cruiser yatay koþul 4

destroyeryataykosul4:
mov eax,10
cmp x_koor,al
jne destroyeryataykosul5
mov eax,10
cmp y_koor,al
jne destroyeryataykosul5
mov al,[tutucu+99]
cmp al,0
jne cruiser
mov al, [tutucu+98]
cmp al,0
jne cruiser
mov al,[tutucu+97]
cmp al,0
jne cruiser


mov al,[tutucu+89]
cmp al,0
jne cruiser
mov al,[tutucu+88]
cmp al,0
jne cruiser
mov al,[tutucu+87]
cmp al,0
jne cruiser



mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al




dec destroyer_number
jmp destroyer
;// ////////////ok

;cruiser yatay koþul 5

destroyeryataykosul5:
mov eax,1
cmp x_koor,al
jne destroyeryataykosul6

mov bl,y_koor
sub bl,1

movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser


add bl,10
movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser









mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al




dec destroyer_number
jmp destroyer
;///////ok

;cruiser yatay koþul 6

destroyeryataykosul6:
mov eax,10
cmp x_koor,al
jne destroyeryataykosul7

mov bl,y_koor
sub bl,1

add bl,90
movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser


sub bl,10
movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser









mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al




dec destroyer_number
jmp destroyer

;///ok

;cruiser yatay koþul 7

destroyeryataykosul7:
mov eax,10
cmp y_koor,al
jne destroyeryataykosul8

mov al,10
mov bl,x_koor
sub bl,1
mul bl
movzx esi,al



mov al,[tutucu+esi+9]
cmp al,0
jne cruiser
mov al, [tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+7]
cmp al,0
jne cruiser




sub bl,10
sub esi,10

mov al,[tutucu+esi+9]
cmp al,0
jne cruiser
mov al, [tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+7]
cmp al,0
jne cruiser


add bl,20
add esi,20
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser
mov al, [tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+7]
cmp al,0
jne cruiser









mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al




dec destroyer_number
jmp destroyer
;/////////ok

;cruiser yatay koþul 8

destroyeryataykosul8:
mov eax,2
cmp y_koor,al
jne destroyeryataykosul9

mov al,10
mov bl,x_koor
sub bl,1
mul bl

movzx esi,al



mov al, [tutucu+esi+2]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al,[tutucu+esi+0]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al, [tutucu+esi+2]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al,[tutucu+esi+0]
cmp al,0
jne cruiser

sub bl,20
sub esi,20


mov al, [tutucu+esi+2]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al,[tutucu+esi+0]
cmp al,0
jne cruiser









mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al




dec destroyer_number
jmp destroyer

;////////ok

;cruiser yatay koþul 9

destroyeryataykosul9:


mov al,10
mov bl,x_koor
sub bl,1
mul bl

movzx esi,al
movzx eax,y_koor
add esi,eax

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser
mov al,[tutucu+esi-3]
cmp al,0
jne cruiser


add bl,10
add esi,10

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser
mov al,[tutucu+esi-3]
cmp al,0
jne cruiser


sub bl,20
sub esi,20
mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser
mov al,[tutucu+esi-3]
cmp al,0
jne cruiser










mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub ah,1
movzx esi,ah

mov [tutucu+esi],al




dec destroyer_number
jmp destroyer



;//////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////
;
; destroyer YATAY SONU
;
;/////////////////////////////////////////////////////////////////////
destroyerdikey:
mov eax,9
call randomize
call randomrange
add ax,2
mov x_koor,al
mov eax,10
call randomize
call randomrange
add eax,1
mov y_koor,al

;cruiser dikey koþul 1

destroyerdikeykosul1:
mov eax,2
cmp x_koor,al
jne destroyerdikeykosul2

mov eax,1
cmp y_koor,al
jne destroyerdikeykosul2






mov al,[tutucu]
cmp al,0
jne cruiser

mov al,[tutucu+1]
cmp al,0
jne cruiser

mov al,[tutucu+10]
cmp al,0
jne cruiser

mov al,[tutucu+11]
cmp al,0
jne cruiser

mov al,[tutucu+20]
cmp al,0
jne cruiser

mov al,[tutucu+21]
cmp al,0
jne cruiser









;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al


dec destroyer_number
jmp destroyer



;cruiser yatay koþul 2

;cruiser dikey koþul 2

destroyerdikeykosul2:
mov eax,2
cmp x_koor,al
jne destroyerdikeykosul3

mov eax,10
cmp y_koor,al
jne destroyerdikeykosul3






mov al,[tutucu+8]
cmp al,0
jne cruiser

mov al,[tutucu+9]
cmp al,0
jne cruiser

mov al,[tutucu+18]
cmp al,0
jne cruiser

mov al,[tutucu+19]
cmp al,0
jne cruiser

mov al,[tutucu+28]
cmp al,0
jne cruiser

mov al,[tutucu+29]
cmp al,0
jne cruiser









;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al


dec destroyer_number
jmp destroyer


;cruiser yatay koþul 3

;cruiser dikey koþul 3

destroyerdikeykosul3:
mov eax,10
cmp x_koor,al
jne destroyerdikeykosul4

mov eax,1
cmp y_koor,al
jne destroyerdikeykosul4







mov al,[tutucu+70]
cmp al,0
jne cruiser

mov al,[tutucu+71]
cmp al,0
jne cruiser

mov al,[tutucu+80]
cmp al,0
jne cruiser

mov al,[tutucu+81]
cmp al,0
jne cruiser

mov al,[tutucu+90]
cmp al,0
jne cruiser

mov al,[tutucu+91]
cmp al,0
jne cruiser








;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al


dec destroyer_number
jmp destroyer



;cruiser yatay koþul 4

;cruiser dikey koþul 4

destroyerdikeykosul4:
mov eax,10
cmp x_koor,al
jne destroyerdikeykosul5

mov eax,10
cmp y_koor,al
jne destroyerdikeykosul5








mov al,[tutucu+78]
cmp al,0
jne cruiser

mov al,[tutucu+79]
cmp al,0
jne cruiser

mov al,[tutucu+88]
cmp al,0
jne cruiser

mov al,[tutucu+89]
cmp al,0
jne cruiser

mov al,[tutucu+98]
cmp al,0
jne cruiser

mov al,[tutucu+99]
cmp al,0
jne cruiser








;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al


dec destroyer_number
jmp destroyer



;cruiser yatay koþul 5

;cruiser dikey koþul 5

destroyerdikeykosul5:
mov eax,10
cmp x_koor,al
jne destroyerdikeykosul6

mov bl,y_koor
sub bl,1

movzx esi,bl






add bl,10
add esi,10

mov al,[tutucu+60+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10
mov al,[tutucu+60+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+60+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi]
cmp al,0
jne cruiser

mov al,[tutucu+60+esi+1]
cmp al,0
jne cruiser





;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al


dec destroyer_number
jmp destroyer


;cruiser yatay koþul 6

;cruiser dikey koþul 6

destroyerdikeykosul6:
mov eax,2
cmp x_koor,al
jne destroyerdikeykosul7

mov bl,y_koor
sub bl,1


movzx esi,bl



mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser







;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al


dec destroyer_number
jmp destroyer



;cruiser yatay koþul 7

;cruiser dikey koþul 7


;burdayým
destroyerdikeykosul7:
mov eax,1
cmp y_koor,al
jne destroyerdikeykosul8

mov bl,x_koor
sub bl,4
mov al,10
mul bl
mov bl,al

movzx esi,bl




add bl,10
add esi,10

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10
mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi+1]
cmp al,0
jne cruiser













;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al


dec destroyer_number
jmp destroyer



;cruiser yatay koþul 8

;cruiser dikey koþul 8

destroyerdikeykosul8:
mov eax,10
cmp y_koor,al
jne destroyerdikeykosul9

mov bl,x_koor
sub bl,4
mov al,10
mul bl
mov bl,al
movzx esi,bl



add bl,10
add esi,10

mov al,[tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser

add bl,10
add esi,10


mov al,[tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser

add bl,10
add esi,10

mov al,[tutucu+esi+8]
cmp al,0
jne cruiser
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser















;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al


dec destroyer_number
jmp destroyer





;cruiser yatay koþul 9




;cruiser dikey koþul 9

destroyerdikeykosul9:



mov bl,y_koor
sub bl,1
mov al,10
mov ah,x_koor
sub ah,4
mul ah
mov bh,al
movzx esi,bl
movzx eax,bh
add esi,eax



add bh,10
add esi,10

mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bh,10
add esi,10
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bh,10
add esi,10
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser

add bh,10
add esi,10
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser

mov al,[tutucu+esi]
cmp al,0
jne cruiser

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser



















;////////////////////////////////
mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,2
movzx esi,ah
mov[tutucu+esi],al
sub esi,10

mov[tutucu+esi],al


dec destroyer_number
jmp destroyer






;//////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////
;
; destroyer DIKEY SONU
;
;/////////////////////////////////////////////////////////////////////





submarine:
movzx eax,submarine_number
cmp eax,0
je basla



mov eax,10
call randomize
call randomrange
add eax,1
mov x_koor,al
mov eax,10
call randomize
call randomrange
add eax,1
mov y_koor,al
;destroyer yatay 


submarinekosul1:

mov eax,1
cmp x_koor,al
jne submarinekosul2
mov eax,1
cmp y_koor,al
jne submarinekosul2


mov al,[tutucu+1]
cmp al,0
jne cruiser
mov al,[tutucu]
cmp al,0
jne cruiser

mov al,[tutucu+10]
cmp al,0
jne cruiser
mov al,[tutucu+11]
cmp al,0
jne cruiser

;//////////////////////////OK

mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,1
movzx esi,ah
mov[tutucu+esi],al





dec submarine_number
jmp submarine
;/////////////////////////ok

;cruiser yatay koþul 2

submarinekosul2:
mov eax,1
cmp x_koor,al
jne submarinekosul3
mov eax,10
cmp y_koor,al
jne submarinekosul3
mov al,[tutucu+9]
cmp al,0
jne cruiser
mov al, [tutucu+8]
cmp al,0
jne cruiser



mov al,[tutucu+19]
cmp al,0
jne cruiser
mov al,[tutucu+18]
cmp al,0
jne cruiser




mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,1
movzx esi,ah
mov[tutucu+esi],al





dec submarine_number
jmp submarine

;//////////////ok

;cruiser yatay koþul 3

submarinekosul3:
mov eax,10
cmp x_koor,al
jne submarinekosul4
mov eax,1
cmp y_koor,al
jne submarinekosul4
mov al,[tutucu+90]
cmp al,0
jne cruiser
mov al, [tutucu+91]
cmp al,0
jne cruiser



mov al,[tutucu+80]
cmp al,0
jne cruiser
mov al,[tutucu+81]
cmp al,0
jne cruiser




mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,1
movzx esi,ah
mov[tutucu+esi],al





dec submarine_number
jmp submarine
;/////////ok

;cruiser yatay koþul 4

submarinekosul4:
mov eax,10
cmp x_koor,al
jne submarinekosul5
mov eax,10
cmp y_koor,al
jne submarinekosul5
mov al,[tutucu+99]
cmp al,0
jne cruiser
mov al, [tutucu+98]
cmp al,0
jne cruiser



mov al,[tutucu+89]
cmp al,0
jne cruiser
mov al,[tutucu+88]
cmp al,0
jne cruiser




mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,1
movzx esi,ah
mov[tutucu+esi],al





dec submarine_number
jmp submarine
;// ////////////ok

;cruiser yatay koþul 5

submarinekosul5:
mov eax,1
cmp x_koor,al
jne submarinekosul6

mov bl,y_koor
sub bl,1

movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser



add bl,10
movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser










mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,1
movzx esi,ah
mov[tutucu+esi],al





dec submarine_number
jmp submarine
;///////ok

;cruiser yatay koþul 6

submarinekosul6:
mov eax,10
cmp x_koor,al
jne submarinekosul7

mov bl,y_koor
sub bl,1

add bl,90
movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser



sub bl,10
movzx esi,bl

mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al, [tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser










mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,1
movzx esi,ah
mov[tutucu+esi],al





dec submarine_number
jmp submarine

;///ok

;cruiser yatay koþul 7

submarinekosul7:
mov eax,10
cmp y_koor,al
jne submarinekosul8

mov al,10
mov bl,x_koor
sub bl,1
mul bl
movzx esi,al



mov al,[tutucu+esi+9]
cmp al,0
jne cruiser
mov al, [tutucu+esi+8]
cmp al,0
jne cruiser





sub bl,10
sub esi,10

mov al,[tutucu+esi+9]
cmp al,0
jne cruiser
mov al, [tutucu+esi+8]
cmp al,0
jne cruiser



add bl,20
add esi,20
mov al,[tutucu+esi+9]
cmp al,0
jne cruiser
mov al, [tutucu+esi+8]
cmp al,0
jne cruiser










mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,1
movzx esi,ah
mov[tutucu+esi],al





dec submarine_number
jmp submarine
;/////////ok

;cruiser yatay koþul 8

submarinekosul8:
mov eax,1
cmp y_koor,al
jne submarinekosul9

mov al,10
mov bl,x_koor
sub bl,1
mul bl

movzx esi,al




mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al,[tutucu+esi+0]
cmp al,0
jne cruiser

add bl,10
add esi,10


mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al,[tutucu+esi+0]
cmp al,0
jne cruiser

sub bl,20
sub esi,20



mov al,[tutucu+esi+1]
cmp al,0
jne cruiser
mov al,[tutucu+esi+0]
cmp al,0
jne cruiser









mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,1
movzx esi,ah
mov[tutucu+esi],al





dec submarine_number
jmp submarine

;////////ok

;cruiser yatay koþul 9

submarinekosul9:


mov al,10
mov bl,x_koor
sub bl,1
mul bl

movzx esi,al
movzx eax,y_koor
add esi,eax

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser



add bl,10
add esi,10

mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser



sub bl,20
sub esi,20
mov al,[tutucu+esi]
cmp al,0
jne cruiser
mov al,[tutucu+esi-1]
cmp al,0
jne cruiser
mov al,[tutucu+esi-2]
cmp al,0
jne cruiser











mov al,10
mov bl,x_koor
sub bl,1
mov carpici,bl
mul carpici
add al,y_koor
sub al,1
mov yardimci,al
mov ah,yardimci

mov al,1
movzx esi,ah
mov[tutucu+esi],al





dec submarine_number
jmp submarine



;//////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////
;
; destroyer YATAY SONU


basla:
















;sondaki satýr atlama
mov al,10
mov [goster+22],al
mov [goster+45],al
mov [goster+68],al
mov [goster+91],al
mov [goster+114],al
mov [goster+137],al
mov [goster+160],al
mov [goster+183],al
mov [goster+206],al
mov [goster+229],al
mov [goster+252],al
mov [goster+275],al
mov [goster+298],al
mov [goster+321],al
mov [goster+344],al
mov [goster+367],al
mov [goster+390],al
mov [goster+413],al
mov [goster+436],al

;186 yerleþtirdik ok...
mov esi,1
mov ecx,10
L1:
mov al,186
mov[goster+esi],al
mov[goster+esi+2],al
mov[goster+esi+4],al
mov[goster+esi+6],al
mov[goster+esi+8],al
mov[goster+esi+10],al
mov[goster+esi+12],al
mov[goster+esi+14],al
mov[goster+esi+16],al
mov[goster+esi+18],al
mov[goster+esi+20],al
add esi,46
loop l1
;186 yerleþtirdik ok...


mov esi,23
mov ecx,9



L2:
mov al,32
mov [goster+esi],al
mov [goster+esi+2],al
mov [goster+esi+4],al
mov [goster+esi+6],al
mov [goster+esi+8],al
mov [goster+esi+10],al
mov [goster+esi+12],al
mov [goster+esi+14],al
mov [goster+esi+16],al
mov [goster+esi+18],al
mov [goster+esi+20],al
add esi,46
loop l2











mov al,48
mov [goster],al

mov al,49
mov [goster+46],al

mov al,50
mov [goster+92],al

mov al,51
mov [goster+138],al

mov al,52
mov [goster+184],al

mov al,53
mov [goster+230],al

mov al,54
mov [goster+276],al

mov al,55
mov [goster+322],al


mov al,56
mov [goster+368],al

mov al,57
mov [goster+414],al

;harfleri attýk

mov ecx,9
mov esi,24
L3:
mov al,204
mov [goster+esi],al
mov al,206
mov [goster+esi+2],al
mov [goster+esi+4],al
mov [goster+esi+6],al
mov [goster+esi+8],al
mov [goster+esi+10],al
mov [goster+esi+12],al
mov [goster+esi+14],al
mov [goster+esi+16],al
mov [goster+esi+18],al
mov al,185
mov [goster+esi+20],al
add esi,46
loop l3





;okuma
;
;///////////////////////////////////////////////////////////////////
okuma:




call clrscr
;ekraný temizledim
mov edx,offset tavan
call writestring
mov edx,offset goster
call writestring



mov al,mesaj
cmp al,6
je iskamesaji

cmp al,5
je vuruldumesaji
cmp al,4
je battlemesaji
cmp al,3
je cruisermesaji
cmp al,2
je destroyermesaji
cmp al,1
je submarinemesaji

jmp kontrolcu

iskamesaji:
mov edx,offset mesajiska
call writestring
jmp kontrolcu


vuruldumesaji:
mov edx,offset mesaj5
call writestring
jmp kontrolcu
battlemesaji:
mov edx,offset mesaj4
call writestring
jmp kontrolcu
cruisermesaji:
mov edx,offset mesaj3
call writestring
jmp kontrolcu
destroyermesaji:
mov edx,offset mesaj2
call writestring
jmp kontrolcu
submarinemesaji:
mov edx,offset mesaj1
call writestring
jmp kontrolcu

kontrolcu:
mov al,gemi_number
cmp al,0
jne sayial
call clrscr
mov edx,offset tavan
call writestring
mov edx,offset goster
call writestring
mov edx,offset tebrik
call writestring
movzx eax,sutcount
call writeint
call readchar
jmp cikis

sayial:
mov edx,offset sayigir
call writestring

birincioku:
call readchar
call isdigit
jnz bip1

cmp al,'0'
jne testa2
mov bl,1
mov x_secim,bl
call writechar
jmp ikincioku

testa2:
cmp al,'1'
jne testa3
mov bl,2
mov x_secim,bl
call writechar
jmp ikincioku

testa3:
cmp al,'2'
jne testa4
mov bl,3
mov x_secim,bl
call writechar
jmp ikincioku

testa4:
cmp al,'3'
jne testa5
mov bl,4
mov x_secim,bl
call writechar
jmp ikincioku

testa5:
cmp al,'4'
jne testa6
mov bl,5
mov x_secim,bl
call writechar
jmp ikincioku

testa6:
cmp al,'5'
jne testa7
mov bl,6
mov x_secim,bl
call writechar
jmp ikincioku

testa7:
cmp al,'6'
jne testa8
mov bl,7
mov x_secim,bl
call writechar
jmp ikincioku

testa8:
cmp al,'7'
jne testa9
mov bl,8
mov x_secim,bl
call writechar
jmp ikincioku

testa9:
cmp al,'8'
jne testa10
mov bl,9
mov x_secim,bl
call writechar
jmp ikincioku

testa10:
cmp al,'9'
mov bl,10
mov x_secim,bl
call writechar
jmp ikincioku

bip1:
mov edx,offset bipci
call writestring
jmp birincioku


ikincioku:
call readchar

;/////////////////////////////////////////////////////////////
testb11:
cmp al,'A'
jne testb12
mov bl,1
mov y_secim,bl
call writechar
jmp islemegec

testb12:
cmp al,'a'
jne testb21
mov bl,1
mov y_secim,bl
call writechar
jmp islemegec

;/////////////////////////////////////////////////////

testb21:
cmp al,'B'
jne testb22
mov bl,2
mov y_secim,bl
call writechar
jmp islemegec

testb22:
cmp al,'b'
jne testb31
mov bl,2
mov y_secim,bl
call writechar
jmp islemegec

;////////////////////////////////////////////////////////

testb31:
cmp al,'C'
jne testb32
mov bl,3
mov y_secim,bl
call writechar
jmp islemegec

testb32:
cmp al,'c'
jne testb41
mov bl,3
mov y_secim,bl
call writechar
jmp islemegec

;////////////////////////////////////////////////////////

testb41:
cmp al,'D'
jne testb42
mov bl,4
mov y_secim,bl
call writechar
jmp islemegec

testb42:
cmp al,'d'
jne testb51
mov bl,4
mov y_secim,bl
call writechar
jmp islemegec

;////////////////////////////////////////////////////////

testb51:
cmp al,'E'
jne testb52
mov bl,5
mov y_secim,bl
call writechar
jmp islemegec

testb52:
cmp al,'e'
jne testb61
mov bl,5
mov y_secim,bl
call writechar
jmp islemegec

;////////////////////////////////////////////////////////

testb61:
cmp al,'F'
jne testb62
mov bl,6
mov y_secim,bl
call writechar
jmp islemegec

testb62:
cmp al,'f'
jne testb71
mov bl,6
mov y_secim,bl
call writechar
jmp islemegec

;////////////////////////////////////////////////////////

testb71:
cmp al,'G'
jne testb72
mov bl,7
mov y_secim,bl
call writechar
jmp islemegec

testb72:
cmp al,'g'
jne testb81
mov bl,7
mov y_secim,bl
call writechar
jmp islemegec

;////////////////////////////////////////////////////////

testb81:
cmp al,'H'
jne testb82
mov bl,8
mov y_secim,bl
call writechar
jmp islemegec

testb82:
cmp al,'h'
jne testb91
mov bl,8
mov y_secim,bl
call writechar
jmp islemegec

;////////////////////////////////////////////////////////

testb91:
cmp al,'I'
jne testb92
mov bl,9
mov y_secim,bl
call writechar
jmp islemegec

testb92:
cmp al,'i'
jne testb101
mov bl,9
mov y_secim,bl
call writechar
jmp islemegec

;////////////////////////////////////////////////////////

testb101:
cmp al,'J'
jne testb102
mov bl,10
mov y_secim,bl
call writechar
jmp islemegec

testb102:
cmp al,'j'
jne testb103
mov bl,10
mov y_secim,bl
call writechar
jmp islemegec

testb103:
cmp al,8
je okuma
jmp bip2

;////////////////////////////////////////////////////////

bip2:
mov edx,offset bipci
call writestring
jmp ikincioku

;////////////////////////////////////
;
;
;
;ekrana yerleþtiridik
;
;
;///////////////////////////////////////


	islemegec:
        call readchar
		cmp al,8
		jne testetenter
		jmp okuma
	testetenter:
	    cmp al,13
		jne bip3
		jmp islembaslat
	bip3:
mov edx,offset bipci
	call writestring
	jmp islemegec
		
		
		islembaslat:
mov al,10
mov bl,x_secim
sub bl,1
mov carpici,bl
mul carpici
add al,y_secim
sub al,1
mov yardimci,al
mov ah,yardimci
movzx esi,ah

mov al,[tutucu+esi]
cmp al,5
je vurulmus
cmp al,4
je battlevurdu
cmp al,3
je cruiservurdu
cmp al,2
je destroyervurdu
cmp al,1
je submarinevurdu

; demekki 0
;
;//////////////////////////////////////////////
mov al,5
mov [tutucu+esi],al
inc sutcount

mov al,46
mov bh,x_secim
sub bh,1
mul bh
movzx esi,ax

mov al,2
mul y_secim
movzx edx,al
add esi,edx
mov al,177
mov [goster+esi],al
mov al,6
mov mesaj,al
jmp okuma
; demekki 0
;
;SIFIR SA HALLETTÝK

;///////////////////////////////////
;
;BATTLE VURDU
;
;/////////////////////////////////////

battlevurdu:
mov al,5
mov [tutucu+esi],al
inc sutcount
dec gemi_number


;////////////////////////
;
;ÇARPIMLA ÝNDEX GOSTERDEKÝ
;
;/////////////////////////////

mov al,46
mov bh,x_secim
sub bh,1
mul bh
movzx esi,ax

mov al,2
mul y_secim
movzx edx,al
add esi,edx

;////////////////////////////////
;
;ÇARPIM ÝNDEKS BULDUK
;
;//////////////////////////////////////

mov al,66
mov [goster+esi],al
mov al,4
mov mesaj,al
jmp okuma

;///////////////////////////////////
;
;BATTLE VURDU
;
;/////////////////////////////////////
;///////////////////////////
;
;CRUÝSER VURDU
;
;//////////////////////////////////////


cruiservurdu:
mov al,5
mov [tutucu+esi],al
inc sutcount
dec gemi_number


;////////////////////////
;
;ÇARPIMLA ÝNDEX GOSTERDEKÝ
;
;/////////////////////////////

mov al,46
mov bh,x_secim
sub bh,1
mul bh
movzx esi,ax

mov al,2
mul y_secim
movzx edx,al
add esi,edx

;////////////////////////////////
;
;ÇARPIM ÝNDEKS BULDUK
;
;//////////////////////////////////////

mov al,67
mov [goster+esi],al
mov al,3
mov mesaj,al
jmp okuma

;///////////////////////////
;
;CRUÝSER VURDU
;
;//////////////////////////////////////

;/////////////////////////////////////
;
;DESTROYER VURDU
;
;/////////////////////////////////////


destroyervurdu:
mov al,5
mov [tutucu+esi],al
inc sutcount
dec gemi_number


;////////////////////////
;
;ÇARPIMLA ÝNDEX GOSTERDEKÝ
;
;/////////////////////////////

mov al,46
mov bh,x_secim
sub bh,1
mul bh
movzx esi,ax

mov al,2
mul y_secim
movzx edx,al
add esi,edx

;////////////////////////////////
;
;ÇARPIM ÝNDEKS BULDUK
;
;//////////////////////////////////////

mov al,68
mov [goster+esi],al
mov al,2
mov mesaj,al
jmp okuma

;/////////////////////////////////////
;
;DESTROYER VURDU
;
;/////////////////////////////////////

;///////////////////////////////////
;
;SUBMARÝNE VURDU
;
;/////////////////////////////////////////////



submarinevurdu:
mov al,5
mov [tutucu+esi],al
inc sutcount
dec gemi_number


;////////////////////////
;
;ÇARPIMLA ÝNDEX GOSTERDEKÝ
;
;/////////////////////////////

mov al,46
mov bh,x_secim
sub bh,1
mul bh
movzx esi,ax

mov al,2
mul y_secim
movzx edx,al
add esi,edx

;////////////////////////////////
;
;ÇARPIM ÝNDEKS BULDUK
;
;//////////////////////////////////////

mov al,83
mov [goster+esi],al
mov al,1
mov mesaj,al
jmp okuma

;///////////////////////////////////
;
;SUBMARÝNE VURDU
;
;/////////////////////////////////////////////

;///////////////////////////////////
;
;VURULMUS
;
;/////////////////////////////////////////////



vurulmus:

mov al,5
mov mesaj,al
jmp okuma

;///////////////////////////////////
;
;VURULMUS
;
;/////////////////////////////////////////////
	

cikis:

	exit
main ENDP
END main
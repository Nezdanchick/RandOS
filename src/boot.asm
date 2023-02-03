;############### SETUP ###############

use16
format binary
org 0x7C00

;include 'multiboot.inc'
include 'print16.inc'
include 'sound.inc'


;############### CODE ###############

start:
; clear registres
xor ax, ax
mov es, ax
mov ds, ax
mov ss, ax
mov sp, 0x1000

; print
print_init

print 'Hi!', 'How are you?'
printb MSG1, nl, MSG2, nl

; sound
call speaker_tone
hlt
call speaker_off
print 'I added sound!'
; halt
jmp _halt

;############### FUNC ###############

_halt:
  jmp _halt

;############### DATA ###############

MSG1 db 'I love you ', 0x3, 0x3, 0x3, 0
MSG2 db '//^w^//', 0

;############### BOOT ###############

times 510-($-$$) db 0 ; compile 512 bytes binary
dw 0xAA55 ; 55 aa bytes

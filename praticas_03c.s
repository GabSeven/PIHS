.section .data
  abertura: .asciz "\nPrograma Operação n1 + n2 - n3 + n4 - n5\n"
  saida: .asciz "Resultado da operação: %d + %d - %d + %d - %d = %d\n"
  peden1: .asciz "\nEntre com o valor de n1 = "
  peden2: .asciz "\nEntre com o valor de n2 = "
  peden3: .asciz "\nEntre com o valor de n3 = "
  peden4: .asciz "\nEntre com o valor de n4 = "
  peden5: .asciz "\nEntre com o valor de n5 = "
  formato: .asciz "%d" # usado pelo scanf para saber o tipo do dado
  # a ser lido

  n1: .int 0
  n2: .int 0
  n3: .int 0
  n4: .int 0
  n5: .int 0
  v1: .int 0, 0, 0, 0, 0
  res: .int 0

.section .text
.globl _start

_1aForma:
  pushl $abertura
  call printf

  pushl $peden1 # empilha mensagem com o endereço da mensagem de pedido
  call printf # e chama o printf para imprimir a mensagem
  pushl $n1 # empilha o endereço da variável
  pushl $formato # empilha o formato do dado a ser lido
  call scanf # chama scanf para faze a leitura na variável

  pushl $peden2
  call printf
  pushl $n2
  pushl $formato
  call scanf

  pushl $peden3
  call printf
  pushl $n3
  pushl $formato
  call scanf

  pushl $peden4
  call printf
  pushl $n4
  pushl $formato
  call scanf

  pushl $peden5
  call printf
  pushl $n5
  pushl $formato
  call scanf

  movl n1, %eax
  addl n2, %eax
  subl n3, %eax
  addl n4, %eax
  subl n5, %eax
  movl %eax, res

  pushl res
  pushl n5
  pushl n4
  pushl n3
  pushl n2
  pushl n1
  pushl $saida
  call printf
  addl $92, %esp # remova os últimos 23 elementos de 4 bytes empilhados

  pushl $0
  call exit


_start:

_2aForma:
  pushl $abertura
  call printf

  movl $v1, %edi
  
  pushl $peden1 # empilha mensagem com o endereço da mensagem de pedido
  call printf # e chama o printf para imprimir a mensagem
  pushl $n1 # empilha o endereço da variável
  pushl $formato # empilha o formato do dado a ser lido
  call scanf # chama scanf para faze a leitura na variável

  movl
  movl (%edi), %eax
  addl $4, %edi

  pushl $peden2 
  call printf 
  pushl %edi 
  pushl $formato 
  call scanf 

  addl (%edi), %eax
  addl $4, %edi

  pushl $peden3 # empilha mensagem com o endereço da mensagem de pedido
  call printf # e chama o printf para imprimir a mensagem
  pushl %edi  # empilha o endereço da variável
  pushl $formato # empilha o formato do dado a ser lido
  call scanf # chama scanf para faze a leitura na variável

  subl (%edi), %eax
  addl $4, %edi

  pushl $peden4 # empilha mensagem com o endereço da mensagem de pedido
  call printf # e chama o printf para imprimir a mensagem
  pushl %edi  # empilha o endereço da variável
  pushl $formato # empilha o formato do dado a ser lido
  call scanf # chama scanf para faze a leitura na variável

  addl (%edi), %eax
  addl $4, %edi

  pushl $peden5 # empilha mensagem com o endereço da mensagem de pedido
  call printf # e chama o printf para imprimir a mensagem
  pushl %edi  # empilha o endereço da variável
  pushl $formato # empilha o formato do dado a ser lido
  call scanf # chama scanf para faze a leitura na variável


  subl (%edi), %eax
  movl %eax, res


  pushl res
  pushl n5
  pushl n4
  pushl n3
  pushl n2
  pushl n1
  pushl $saida
  call printf
  addl $92, %esp # remova os últimos 23 elementos de 4 bytes empilhados

  pushl $0
  call exit

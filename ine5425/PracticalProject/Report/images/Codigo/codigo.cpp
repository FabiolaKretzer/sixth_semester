;
; Declaracoes modelo para o modulo: BasicProcess.Create 1 (Cliente chega no restaurante)
;

18$ CREATE, 1,SecondstoBaseTime(0.0),cliente :
        SecondstoBaseTime(64 + 41 * BETA(2.7, 2.79)) :
        NEXT(19$);

19$ ASSIGN: Cliente chega no restaurante.NumberOut =
        Cliente chega no restaurante.NumberOut + 1 :
        NEXT(16$);

;
; Declaracoes modelo para o modulo:  AdvancedProcess.Assign Attribute 1 (Guarda tempo de chegada)
;
16$ ASSIGN: A(NSYM(TempoDeChegada),IDENT) =
        TNOW :
        NEXT(0$);

;
; Declaracoes modelo para o modulo:  AdvancedProcess.Seize 1 (Cliente quer ser atendido pelo atendente)
;
0$ QUEUE, Cliente quer ser atendido pelo atendente.Queue;
        SEIZE, 2, Other :
        Atendentes, 1 :
        NEXT(23$);

23$ DELAY: 0.0, , VA :
        NEXT(22$);

22$ DELAY: 0.0 , , VA : 
        NEXT(4$);

;
; Declaracoes modelo para o modulo:  AdvancedProcess.Seize 2 (Cliente quer uma mesa)
;
4$  QUEUE, Cliente quer uma mesa.Queue;
        SEIZE, 2, Other :
        Mesas, 1 :
        NEXT(25$);

25$ DELAY: 0.0, , VA : 
        NEXT(24$);

24$ DELAY: 0.0, , VA : 
        NEXT(17$);

;
; Declaracoes modelo para o modulo:  AdvancedProcess.Delay 4 (Cliente aguarda realizacao do pedido)
;
17$ DELAY: UNIF(2, 5), , Other :
        NEXT(2$);


;
; Declaracoes modelo para o modulo:  AdvancedProcess.Release 1 (Cliente finaliza o pedido e libera atendente)
;
2$ RELEASE: Atendentes, 1 :
        NEXT(6$);


;
; Declaracoes modelo para o modulo:  AdvancedProcess.Seize 3 (Cliente quer um cozinheiro prepare seu pedido)
;
6$  QUEUE, Cliente quer um cozinheiro prepare seu pedido.Queue;
        SEIZE, 2, Other :
        Cozinheiros, 1 :
        NEXT(27$);

27$ DELAY: 0.0, , VA :
        NEXT(26$);

26$ DELAY: 0.0, , VA :
        NEXT(8$);

;
; Declaracoes modelo para o modulo:  AdvancedProcess.Delay 2 (Cliente aguarda o preparo do seu pedido)
;
8$  DELAY: UNIF(3,8), , Other :
        NEXT(9$);

;
; Declaracoes modelo para o modulo:  AdvancedProcess.Release 2 (O cozinheiro finaliza e entrega o pedido)
;
9$  RELEASE: Cozinheiros, 1 :
        NEXT(10$);

;
; Declaracoes modelo para o modulo:  AdvancedProcess.Delay 3 (Tempo de alimentacao do cliente)
;
10$ DELAY: 23 + GAMM(7.95, 1.49), , Other :
        NEXT(11$);

;
; Declaracoes modelo para o modulo:  AdvancedProcess.Release 3 (Cliente libera a mesa)
;
11$ RELEASE: Mesas, 1 :
        NEXT(3$);

;
; Declaracoes modelo para o modulo:  BasicProcess.Dispose 1 (Cliente sai da restaurante)
;
3$  ASSIGN: Cliente sai da restaurante.NumberOut =
        Cliente sai da restaurante.NumberOut + 1;
28$ DISPOSE: No;


;
; Declaracoes modelo para o modulo:  BasicProcess.Create 2 (Cria entidade de controle)
;
29$ CREATE, 1, MinutesToBaseTime(0.0), controle :
        MinutesToBaseTime(1) :
        NEXT(30$);

30$ ASSIGN: Cria entidade de controle.NumberOut =
        Cria entidade de controle.NumberOut + 1 :
        NEXT(12$);

;
; Declaracoes modelo para o modulo:  AdvancedProcess.Search 1 (Procura clientes esperando muito tempo)
;
12$ SEARCH, Cliente quer ser atendido pelo atendente.Queue, 1,
            NQ(Cliente quer ser atendido pelo atendente.Queue) :
        TNOW - TempoDeChegada > 20  && DISC(0.99, 0, 1.0, 1);
33$ BRANCH, 1:
        If,J<>0,34$,Yes:
        Else,35$,Yes;

34$ DELAY: 0.0, , VA :
        NEXT(14$);

35$ DELAY: 0.0, , VA :
        NEXT(13$);

;
; Declaracoes modelo para o modulo:  AdvancedProcess.Remove 1 (Remove a entidade encontrada)
;
14$ REMOVE: J, Cliente quer ser atendido pelo atendente.Queue, 15$ :
        NEXT(12$);

;
;     Declaracoes modelo para o modulo:  BasicProcess.Dispose 3 (Cliente cansou e vai embora)
;
15$ ASSIGN: Cliente cansou e vai embora.NumberOut =
        Cliente cansou e vai embora.NumberOut + 1;
36$ DISPOSE: Yes;

;
;     Declaracoes modelo para o modulo:  BasicProcess.Dispose 2 (Controle Vai embora)
;
13$ ASSIGN: Controle Vai embora.NumberOut =
        Controle Vai embora.NumberOut + 1;
37$ DISPOSE: Yes;
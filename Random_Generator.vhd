Library IEEE ;
Use IEEE.STD_Logic_1164.All ;

Entity Random_Generator Is
 Generic(
  G_Width : Integer := 16 
 ) ;
 Port(
  I_Clock  : In  STD_Logic ;
  O_Random : Out STD_Logic_Vector(G_Width-1 Downto 0)
 ) ;
End Random_Generator;

Architecture Behavioral Of Random_Generator Is
 
 Type T_Noise_Vector_2D Is Array(0 To G_Width-1) Of STD_Logic_Vector(0 To G_Width-1) ;
 
 Signal W_Noise_Vector_2D : T_Noise_Vector_2D ;
 Signal R_Noise_Vector_2D : T_Noise_Vector_2D                          := (Others=>(Others=>'0')) ;
 Signal R_Random_Vector   : STD_Logic_Vector(G_Width-1 Downto 0) := (Others=>'0') ;
 
Begin
 
 Loop1 : For N In 0 To G_Width-1 Generate Begin
  Loop2 : For M In 0 To G_Width-1 Generate Begin
   W_Noise_Vector_2D(N)(M) <= Not W_Noise_Vector_2D(N)(M) ;
  End Generate ;
 End Generate ;
 
 Process(I_CLock) 
  Variable V_Noise_Vector_1D : STD_Logic_Vector(0 To G_Width-1) ;
 Begin
  If Rising_Edge(I_Clock) Then
   
   R_Noise_Vector_2D <= W_Noise_Vector_2D ;
   
   V_Noise_Vector_1D := (Others=>'0') ; 
   For N In 0 To G_Width-1 Loop
    For M In 0 To G_Width-1 Loop
     V_Noise_Vector_1D(N) := R_Noise_Vector_2D(N)(M) XOR V_Noise_Vector_1D(N) ;
    End Loop ;
    R_Random_Vector(N) <= V_Noise_Vector_1D(N) ;
   End Loop ;

  End If ;
 End Process ;

 O_Random <= R_Random_Vector ;

End Behavioral ;
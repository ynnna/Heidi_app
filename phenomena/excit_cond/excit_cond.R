#xcitatory conditioning

alpha_value =  input$alpha_excit_cond
beta_value = input$beta_excit_cond
selected_trial = input$trial_no_excit_cond




#Dataframe
n_trial<-as.numeric(selected_trial)
half_trial<- n_trial/2
trial<- c(1:n_trial)
alpha<- rep(alpha_value, n_trial)
beta<- rep(beta_value, n_trial)
df<- data.frame(trial, alpha, beta)
df<- model(df)

df_long<- to.long(df)
df_long<-label.df(df_long)
df_long <- (df_long[df_long$ass_indicator %in% c('CS-US', 'US-CS', 'ΣV'),])




#Spacing on x axis
if (n_trial <= 20) {
  seq(0, n_trial, 5)
  x_spacing <- seq(0, n_trial, 1)
} else if (n_trial > 20){
  x_spacing<- seq(0, n_trial, 5)}



#Limits y axis
decide_max_y_limit<- function (y_vector) {
  max_y<- max(y_vector)
  max_y<- round((1.5* max_y),1)
  return(max_y)
}


decide_min_y_limit<- function (y_vector) {
  min_y<- min(y_vector)
  min_y<- round((1.5* min_y),1)
  return(min_y)
}
max_y_limit<- decide_max_y_limit(df_long$value_ass)
min_y_limit<- decide_min_y_limit(df_long$value_ass)


#Associative strenght plot

labels_p<- c(expression('V'[CS-US]), expression('V'[US-CS]), expression('V'[COMB]))
a<- ggplot(df_long, aes(x= factor(trial), y= value_ass, group= ass_indicator))+
  geom_line(size= 1, color= '#000000', linetype = 'solid')+
  geom_point(size= 3, color= '#000000', aes(shape= ass_indicator, fill= ass_indicator))+
  scale_fill_manual(values=  c( "#C0C0C0", "#C0C0C0", "#FF0000"), labels= labels_p)+
  scale_shape_manual(values= c(21, 15,  22), labels= labels_p)+
  scale_y_continuous (name= expression('Associative strength (V)'), limits = c(min_y_limit, max_y_limit)) +
  scale_x_discrete(name= "Trials", breaks= x_spacing)+
  theme_bw()+
  my_theme+
  theme(legend.title=element_blank())

#Performance plot
labels_q<- c(expression('R'[CS]), expression('R'[US]))
b<- ggplot(df_long, aes(x= factor(trial), y= value_response, group= response_type))+
  geom_line(size= 1, color= '#000000')+
  geom_point(size= 3,color= '#000000', shape=21, aes(fill= response_type))+
  scale_fill_manual(values=  c("#000000", "#C0C0C0"), labels= labels_q)+
  scale_color_manual(values= c("#000000", "#C0C0C0"), labels= labels_q)+
  scale_y_continuous (name= expression('Distribution of V'[COMB]), limits = c(min_y_limit, max_y_limit)) +
  scale_x_discrete(name= "Trials", breaks = x_spacing)+
  theme_bw()+
  my_theme+
  theme(legend.title=element_blank())


p <- plot_grid(NULL, 
               a,
               b,
               align = 'hv',
               labels = c("", "A", "B"),
               hjust = -1,
               ncol=1,
               nrow = 3, rel_heights = c(0.2, 1,1))
p<- p+ draw_label(label= 'Excitatory conditioning', x= 0.5 ,y=0.97, color =  "#d73925", size= 16)


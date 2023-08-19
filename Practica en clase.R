library(shiny)

ui <- fluidPage(
  titlePanel("Planificador de Eventos"),
  
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "nombre_evento", 
                label = "Nombre del evento",
                placeholder = "Boda de María y Julio" 
                
      ),
      selectInput(inputId = "tema_evento", 
                  label = "Tema del evento", 
                  choices = c("Boda","Fiesta de cumpleaños","Conferencia","Otro"),
                  multiple = FALSE, 
                  width = "100%", 
                  
      ),
      numericInput(inputId = "invitados", 
                   label = "Número de invitados", 
                   value =58, 
                   min = 25, 
                   max = 120, 
      ),
      selectInput(inputId = "selector_provincia", 
                  label = "Provinvcia", 
                  choices = c("Cartago", "Heredia","San José", "Limón","Puntarenas","Alajuela"),
                  multiple = FALSE, 
                  width = "100%", 
      ),
    ),
    mainPanel(
      h3(strong("Vamos a planificar su día especial", style = "color:blue"),align = "center"),
      tags$hr(style="border-color: lightblue;"),
      h4(strong("Detalles del Evento:")),
      br(),
      textOutput("evento"),
      br(),
      textOutput("tema"),
      br(),
      textOutput("invitados_ubic")
      
      
    )
  )
)

server <- function(input, output, session) {
  output$evento <- renderText(paste0("Nombre del evento:  ",input$nombre_evento
  ))
  output$tema <- renderText(paste0("Tema del evento:  ",input$tema_evento
  ))
  output$invitados_ubic <- renderText(paste0("El evento  ",input$tema_evento, " tendrá ",input$invitados, " invitados y será llevado a cabo en ",input$selector_provincia
  ))
  
}

shinyApp(ui, server)


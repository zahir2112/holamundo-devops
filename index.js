const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hola Mundo DevOps! 🚀');
});

// Exportar la app para pruebas
module.exports = app;

// Si se ejecuta directamente: levantar servidor
if (require.main === module) {
  const port = process.env.PORT || 3000;
  app.listen(port, () => console.log(`Servidor escuchando en puerto ${port}`));
}

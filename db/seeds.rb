# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rols = Rol.create(
  [
    {
      name: "Customer",
      rol: "c",
    },
    {
      name: "Admin",
      rol: "a",
    },
  ]
)

translations = Translation.create([
  {
    key: 'first_name_blank_validation',
    translation: 'Debe ingresar su nombre',
  },
  {
    key: 'password_blank_validation',
    translation: 'Debe ingresar su contraseña',
  },

])

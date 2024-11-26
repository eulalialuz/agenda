class AtualizarUsuarioIdEmContatos < ActiveRecord::Migration[8.0]
  def up
    # Substitua o ID do usuário pelo ID de um usuário existente
    usuario_id = Usuario.first.id # Exemplo: pegar o primeiro usuário
    Contato.where(usuario_id: nil).update_all(usuario_id: usuario_id)
  end

  def down
    # Nenhuma ação necessária no down, já que é irreversível
  end
end

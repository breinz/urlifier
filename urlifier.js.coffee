urlifier = (value) ->
  value = value.toLowerCase()
  
  # Remplace tous les caractère accentués
  from = "ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûýýþÿ".split('')
  to =   'aaaaaaaceeeeiiiidnoooooouuuuybsaaaaaaaceeeeiiiidnoooooouuuyyby'.split('')
  for element, i in from
    value = value.replace(new RegExp(from[i], 'gi'), to[i])
  
  # Supprime tous les guillemets
  value = value.replace(/['"]/gi, '')
  
  # Remplace tout ce qui n'est pas chiffre/lettre/-/_ par -
  value = value.replace(/[^(a-z)\d-_]/gi, '-')
  
  # Supprime les double -
  value = value.replace(/--/g, '-') while value.search('--') > -1
  value
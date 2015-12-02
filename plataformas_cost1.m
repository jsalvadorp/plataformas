function value = plataformas_cost1(num_plats, num_pozos, plats_costos, x, plats_num_pozos, plats_pozos, kill_number)

  % dbstop(20)

  cubierto = zeros(1,num_pozos);
  num_cubiertos = 0;

  for plat=1:num_plats
    if bitget(x, plat) 
      for pozo=1:plats_num_pozos(plat)
        if !cubierto(plats_pozos{plat}(pozo)) 
          cubierto(plats_pozos{plat}(pozo)) = 1;
          num_cubiertos++;
        end
      end
    end
  end
  if num_cubiertos < num_pozos 
    value = kill_number
  end
  if num_cubiertos == num_pozos 
    value = sum(arrayfun(@(plat)(bitget(x, plat) * plats_costos(plat)), (1:num_plats)))
  end



endfunction


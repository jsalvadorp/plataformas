function value = plataformas_cost1(num_plats, plats_costos, x)

value = sum(arrayfun(@(plat)(bitget(x, plat) * plats_costos(plat)), (1:num_plats)))

endfunction


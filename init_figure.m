function init_figure

    set (gcf, 'keypressfcn', @(src,eventdata)key_pressed_fcn(src, eventdata));     
    title('mypacman v1.0')
end
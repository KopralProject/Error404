#!/bin/bash
#
# This File Update at Sat 09 Mar 2024 06:14:11 AM WIB
# +--------------------------------------------------+
# | Author  : github.com                             |
# | Zone    : ( Asia )                               |
# | Website : github.com / Admin  @github            |
# +--------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com
# Sponsor this github project:
# -  https://github.com
# -  https://github.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @github / github@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @github / github@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | Km:tr:ex:49:9J:55:V4:XX:iI:jC:Go:cO:qQ:fH:kq:tN:tF:9M:FH:F1:OM:o2:QW:Jq:Cz:Dm:tY:gs:7d:8f:YD:ya:o6:T1:7C:xt:du:zn:WF:X7:kg:Vv:GI:uy:j3:QF:SK:8e:FX:mM:qW:eA:cN:ZK:Iu:tI:rU:9u:k7:H1:G8:7P:yl:2q:BT:gJ:bi:2c:8h:rD:Rs:iJ:Lv:J4:f0:iG:Q2:1N:LX:ih:Nq:xu:LC:L9:HQ:Wi:Sh:dE:Ps:q7:02:F3:Hq:xT:Vi:2n:PH:6b:Rn:TS:8a:Uj:Se:Zf:vJ:7F:Aj:9r:YD:BF:fG:j2:rQ:2b:Yc:in:tR:n9:yB:N9:1D:nD:y1:VD:5n:9e:s2:Bg:wK:Lh:hF:nK:Tp:fY:AC:5m:QE:su:Qy:Wf:1U:jK:7Z:27:IH:K9:6l:rX:SY:Pu:XZ:3l:3G:Fq:Kr:vx:xV:CH:k7:Al:9V:lm:jy:7T:EO:YQ:IP:5F:FV:W1:eT:GN:nV:Zn:UB:9u:ti:mO:gQ:UX:6M:31:P0:WS:dQ:8d:S4:vo:UU:sz:gk:Bk:vB:BA:h3:HU:9T:7p:Py:5W:Cz:Zo:AN:2e:ON:PN:3d:xq:jB:gN:F4:h2:A0:Jy:fk:nY:d0:Nq:F0:xI:oG:pj:Et:jd:yF:2p:Nm:Tz:vz:M7:u1:wc:7V:QD:dD:Pc:Mo:XR:iq:u7:0Q:1j:vv:KP:k8:aS:lQ:HX:k8:ey:8j:Rh:vW:T2:tk:ep:Z2:HW:EV:Vt:3r:jS:bK:wS:Bd:Qq:Wo:5w:EH:nR:NB:O6:z8:im:WL:r5:dm:sM:ZV:qI:9b:1g:nL:J4:a1:yc:i9:Uu:zd:Xx:vM:1w:uL:N0:d9:hw:PN:UG:cA:s2:jk:RW:vt:lU:KF:El:BP:Ph:2g:j2:DZ:Q7:Ub:gr:VF:o1:v7:f7:xz:E8:8x:Lw:nf:79:Js:V2:CJ:hJ:Hw:sw:lz:uM:jl:K8:UT:jH:4C:Fp:u0:sq:ws:si:F3:fZ:Ws:Vn:0p:1N:pv:Tk:4g:2H:lY:2Q:TY:mS:y3:zJ:40:w4:79:k7:jZ:en:yG:Hy:XW:w3:v9:ew:qJ:UI:PY:aT:sC:C2:Gd:A3:dT:90:HP:I3:uS:PF:V7:oG:OY:rY:BK:t7:MU:Uy:dB:TB:rR:TK:JU:TJ:FU:eZ:fu:cg:5s:Hk:ea:Lt:z4:VF:eq:K1:Nd:t4:iZ:rZ:xR:Lv:Dc:JA:Xx:Bj:T2:hn:Jj:Ql:7T:vt:YE:sS:4v:GJ:TI:zo:Y6:Rx:mc:7F:ny:Zd:B0:rT:0z:IL:1W:hQ:ay:P8:lZ:xE:40:FC:dj:Vi:XH:mR:Ce:aJ:5I:ts:c3:ER:ya:22:cP:mR:PZ:fx:95:Rm:7b:Xi:Ej:O6:Tv:9z:Re:HX:Rp:lf:c8:po:Fu:4e:oX:Fx:yu:TW:q3:pj:Aq:9Q:Ra:wh:Wh:Yo:wX:GN:9G:dA:6s:Ui:cn:DV: | github | Km:tr:ex:49:9J:55:V4:XX:iI:jC:Go:cO:qQ:fH:kq:tN:tF:9M:FH:F1:OM:o2:QW:Jq:Cz:Dm:tY:gs:7d:8f:YD:ya:o6:T1:7C:xt:du:zn:WF:X7:kg:Vv:GI:uy:j3:QF:SK:8e:FX:mM:qW:eA:cN:ZK:Iu:tI:rU:9u:k7:H1:G8:7P:yl:2q:BT:gJ:bi:2c:8h:rD:Rs:iJ:Lv:J4:f0:iG:Q2:1N:LX:ih:Nq:xu:LC:L9:HQ:Wi:Sh:dE:Ps:q7:02:F3:Hq:xT:Vi:2n:PH:6b:Rn:TS:8a:Uj:Se:Zf:vJ:7F:Aj:9r:YD:BF:fG:j2:rQ:2b:Yc:in:tR:n9:yB:N9:1D:nD:y1:VD:5n:9e:s2:Bg:wK:Lh:hF:nK:Tp:fY:AC:5m:QE:su:Qy:Wf:1U:jK:7Z:27:IH:K9:6l:rX:SY:Pu:XZ:3l:3G:Fq:Kr:vx:xV:CH:k7:Al:9V:lm:jy:7T:EO:YQ:IP:5F:FV:W1:eT:GN:nV:Zn:UB:9u:ti:mO:gQ:UX:6M:31:P0:WS:dQ:8d:S4:vo:UU:sz:gk:Bk:vB:BA:h3:HU:9T:7p:Py:5W:Cz:Zo:AN:2e:ON:PN:3d:xq:jB:gN:F4:h2:A0:Jy:fk:nY:d0:Nq:F0:xI:oG:pj:Et:jd:yF:2p:Nm:Tz:vz:M7:u1:wc:7V:QD:dD:Pc:Mo:XR:iq:u7:0Q:1j:vv:KP:k8:aS:lQ:HX:k8:ey:8j:Rh:vW:T2:tk:ep:Z2:HW:EV:Vt:3r:jS:bK:wS:Bd:Qq:Wo:5w:EH:nR:NB:O6:z8:im:WL:r5:dm:sM:ZV:qI:9b:1g:nL:J4:a1:yc:i9:Uu:zd:Xx:vM:1w:uL:N0:d9:hw:PN:UG:cA:s2:jk:RW:vt:lU:KF:El:BP:Ph:2g:j2:DZ:Q7:Ub:gr:VF:o1:v7:f7:xz:E8:8x:Lw:nf:79:Js:V2:CJ:hJ:Hw:sw:lz:uM:jl:K8:UT:jH:4C:Fp:u0:sq:ws:si:F3:fZ:Ws:Vn:0p:1N:pv:Tk:4g:2H:lY:2Q:TY:mS:y3:zJ:40:w4:79:k7:jZ:en:yG:Hy:XW:w3:v9:ew:qJ:UI:PY:aT:sC:C2:Gd:A3:dT:90:HP:I3:uS:PF:V7:oG:OY:rY:BK:t7:MU:Uy:dB:TB:rR:TK:JU:TJ:FU:eZ:fu:cg:5s:Hk:ea:Lt:z4:VF:eq:K1:Nd:t4:iZ:rZ:xR:Lv:Dc:JA:Xx:Bj:T2:hn:Jj:Ql:7T:vt:YE:sS:4v:GJ:TI:zo:Y6:Rx:mc:7F:ny:Zd:B0:rT:0z:IL:1W:hQ:ay:P8:lZ:xE:40:FC:dj:Vi:XH:mR:Ce:aJ:5I:ts:c3:ER:ya:22:cP:mR:PZ:fx:95:Rm:7b:Xi:Ej:O6:Tv:9z:Re:HX:Rp:lf:c8:po:Fu:4e:oX:Fx:yu:TW:q3:pj:Aq:9Q:Ra:wh:Wh:Yo:wX:GN:9G:dA:6s:Ui:cn:DV: | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	?��w
�d�����f���>׬�ΐ�"!;�Y�$��Į`y@a�}j�)�����D��VS�-y4�rml�)u��+�lĺ���K���
W�I �f�+��?��ty�����t&Q������M唀�A p�.�z����8*E����K���,�ύ.���+��-�b��I':����~}�<��ǃKը E�6��<��/�Ā$��_/�Ab��$���A�H��Td�>�?�qtڲ��s� ��8UPӰ
H��zk2��B�N[���d�+;�
Ɛ�iX��a%-x"��������O;���SMR�~�`y�l{��]/��5�K\we��w��AWk>��V%"��fq	��/���8����-�޶�s�^�Ş�	|7;`��Lc�0���adە�+�_�g��p�������R^D/���l�]�T�n版-`��#� I�QY�L!�e��N����:��zG�,�����}��.�����l��%1���`��r�C߳�I8�<g:eQ��~_#P\�	��=yd���:���$CE.\�]�1���X6m�VxM�hfq$�%6��N\$:�w=�� �����J) w+�6ɏ�;�f4�!2�O����G�˫��T�YI��i3ؖ.Ϲ�:�}���]U#Aʙ�0�;*�^��G�n��B��8 :p~�����n��
�k�,�^f��b6,=�O/B�HL��n�7��\�͂e��;��2�ݦ����E�d�z:��dU���iD/g�F�m��j�dA4=:�T�Ɯ/�Nk�����+4JF0<��d�,����J8d9��uW:�6Ji6( ?���P����V�<@nʙ�B�
aR
J�n��"k�iW�]xA�*�c���</�i�-(Q&ƇA�N��l�1�`�S|3�HrҤ���⢶W1����[_@��+�.p+\�����2>�~i?zВ3��y��tV�JFiw Coj�i�-ߕW�*���m� ��P�_�Bx����_���^���~��dT�,���h��B�j�q�,X�C���D���\�	���Q�
��g�I0%��U�X�&w�iG�pD���8����Ĩ���V�S�w�$���=eg�I��Һ��7tRR��t4�coRu�~�n�ptk"!N���JC�aDv��R���J�F���m]�Kv��3SOOs����'�i�|;�b�P�(��@�
]��{Q/A�B���Y�=��H��h�H�Zᵇs�G-�o�q���:�ۦ��%:��z�U@IҍK���y��
G%����_�J�9�(�ix��Ѿr�(ۭ���p�+5S+PQvh��-Ӝ;���x6�@�&�M�|�ͱ(��u�6�* (a�SHD>���l�8(F!�vS�>i����F/J-�zu�Ew��2J�_P	�g�y�(����0
fp�At��5@k��b�

�[:���_�r��-7���h�,^�C��i����h��$�/yY�X|,{��.�j0�e�5bV\)���9;a\_@��^f!Z��{��Tc��Qrt+ŉ"ZH8��u��i<�)�h���)����#�W~����<�u�����:N�~�]hGL�U"Z��U%�)�&%&�v�į	MS�aLZV)�>�u�9}f�Ɩ��S�x�' 	Y��d�W�¤y��3i��蕁�W�� }5_��~Զ�@@);�EQ�'�DK
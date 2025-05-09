#!/bin/bash
#
# This File Update at Sat 09 Mar 2024 06:04:16 AM WIB
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | 75:f6:vz:zj:up:1N:Jf:PU:Mr:za:CM:dG:xU:eg:Tu:4l:SM:98:SC:0X:QQ:We:vS:kW:fd:rI:Fk:9j:Qh:oS:eu:S7:zb:RI:zY:7s:ml:Gp:jk:7H:bB:nA:NV:PI:eh:4i:OL:zO:YS:Zr:T3:Sc:eC:Wb:12:qR:qP:58:ba:ia:Y5:qR:n3:Sc:ja:Ik:ZK:8j:9q:Dj:K0:5H:ai:4Z:7k:rC:kY:KV:mu:4j:rA:39:Op:Se:Sb:Y8:7w:PB:xO:9u:In:Fq:We:oM:W7:3k:Pj:va:gU:xy:tP:GZ:EI:6E:Qq:vU:Gw:BC:qw:xu:Rh:Jc:Se:KT:J1:i5:Jd:Cc:WU:SX:6i:7Y:Nt:Oc:PA:3f:c8:EH:GT:P8:6c:9M:rr:lf:Dt:iF:A5:mZ:Sx:FZ:UT:N2:EA:SR:f2:9n:5D:Ot:ka:42:Uh:3L:cc:4f:yG:oS:IQ:rh:1E:dX:m7:AJ:I5:cQ:yG:6I:Oe:6l:MG:E9:Af:nw:Hw:CS:ax:Ch:KY:QN:pM:ig:jA:DX:Tb:n2:al:av:dd:LB:2K:o1:M1:Co:fD:Gl:bg:kB:Ls:uE:S2:eC:Fk:qy:lM:LQ:Py:c0:ZT:at:2r:ie:OV:EW:fc:Y9:jV:YA:dn:De:EV:Wc:sX:ky:47:XJ:Ru:00:DL:6J:2R:GM:sU:Pb:UR:vA:vm:Yd:c6:Wn:nj:kN:fb:tm:AX:bd:1i:5i:Eg:8t:on:Q1:ae:L5:LE:gv:jS:WI:Ui:86:oI:rs:lh:y3:Cm:gL:EM:hg:5Q:sA:IQ:Gg:sp:Rd:5T:mi:rb:Eq:vL:yh:9z:Eh:el:L1:mH:Vj:SM:qb:bd:I1:4g:G4:V0:Nb:8Y:dj:vG:4j:xG:Lr:EK:2l:fU:Hl:bD:Yu:bQ:oh:t5:VP:7X:mU:MJ:np:sj:fh:Wy:Lx:Aj:1n:0h:BU:TL:DI:P6:Sa:9n:SR:wC:Aw:WU:KF:at:wX:aY:sL:rI:Xm:Or:8R:FB:Vp:9e:no:iq:Cj:DH:3O:pt:VJ:Fm:ew:gQ:TU:GL:UC:2c:Gf:on:98:i1:Ls:6v:jw:TP:Qd:rE:ff:1I:eI:bt:fS:7K:tu:2n:lw:NF:rn:Fd:Bw:I1:yb:ss:KB:Mb:ec:GD:D3:BC:Nd:Zv:DS:fK:rN:Y8:WT:IH:Sp:qL:Ab:ua:eD:7u:ua:V8:W2:Hd:ZW:DQ:lF:PQ:X0:Wu:lj:uJ:Iy:q0:pT:uv:n6:lD:ZM:Gw:4b:vZ:Jl:fK:xn:V7:Jk:UT:aU:sG:Xz:M6:o0:Xn:46:9M:Xk:oT:eu:Xj:CH:yB:Al:CV:8H:Gm:Ur:pD:rL:MD:q0:vY:z8:Pr:FW:ah:Bj:Sm:Sd:mp:0S:HK:X1:1L:Nq:xd:sw:lL:gm:0Y:Ia:xR:jG:0m:G4:tC:8L:OU:Gi:VK:zx:QE:yp:TC:2E:Er:II:bq:9Y:0u:m8:IQ:BI:31:6O:aS:cj:Jl:qB:wY:sU:0s:1E:o9:Nj | github | 75:f6:vz:zj:up:1N:Jf:PU:Mr:za:CM:dG:xU:eg:Tu:4l:SM:98:SC:0X:QQ:We:vS:kW:fd:rI:Fk:9j:Qh:oS:eu:S7:zb:RI:zY:7s:ml:Gp:jk:7H:bB:nA:NV:PI:eh:4i:OL:zO:YS:Zr:T3:Sc:eC:Wb:12:qR:qP:58:ba:ia:Y5:qR:n3:Sc:ja:Ik:ZK:8j:9q:Dj:K0:5H:ai:4Z:7k:rC:kY:KV:mu:4j:rA:39:Op:Se:Sb:Y8:7w:PB:xO:9u:In:Fq:We:oM:W7:3k:Pj:va:gU:xy:tP:GZ:EI:6E:Qq:vU:Gw:BC:qw:xu:Rh:Jc:Se:KT:J1:i5:Jd:Cc:WU:SX:6i:7Y:Nt:Oc:PA:3f:c8:EH:GT:P8:6c:9M:rr:lf:Dt:iF:A5:mZ:Sx:FZ:UT:N2:EA:SR:f2:9n:5D:Ot:ka:42:Uh:3L:cc:4f:yG:oS:IQ:rh:1E:dX:m7:AJ:I5:cQ:yG:6I:Oe:6l:MG:E9:Af:nw:Hw:CS:ax:Ch:KY:QN:pM:ig:jA:DX:Tb:n2:al:av:dd:LB:2K:o1:M1:Co:fD:Gl:bg:kB:Ls:uE:S2:eC:Fk:qy:lM:LQ:Py:c0:ZT:at:2r:ie:OV:EW:fc:Y9:jV:YA:dn:De:EV:Wc:sX:ky:47:XJ:Ru:00:DL:6J:2R:GM:sU:Pb:UR:vA:vm:Yd:c6:Wn:nj:kN:fb:tm:AX:bd:1i:5i:Eg:8t:on:Q1:ae:L5:LE:gv:jS:WI:Ui:86:oI:rs:lh:y3:Cm:gL:EM:hg:5Q:sA:IQ:Gg:sp:Rd:5T:mi:rb:Eq:vL:yh:9z:Eh:el:L1:mH:Vj:SM:qb:bd:I1:4g:G4:V0:Nb:8Y:dj:vG:4j:xG:Lr:EK:2l:fU:Hl:bD:Yu:bQ:oh:t5:VP:7X:mU:MJ:np:sj:fh:Wy:Lx:Aj:1n:0h:BU:TL:DI:P6:Sa:9n:SR:wC:Aw:WU:KF:at:wX:aY:sL:rI:Xm:Or:8R:FB:Vp:9e:no:iq:Cj:DH:3O:pt:VJ:Fm:ew:gQ:TU:GL:UC:2c:Gf:on:98:i1:Ls:6v:jw:TP:Qd:rE:ff:1I:eI:bt:fS:7K:tu:2n:lw:NF:rn:Fd:Bw:I1:yb:ss:KB:Mb:ec:GD:D3:BC:Nd:Zv:DS:fK:rN:Y8:WT:IH:Sp:qL:Ab:ua:eD:7u:ua:V8:W2:Hd:ZW:DQ:lF:PQ:X0:Wu:lj:uJ:Iy:q0:pT:uv:n6:lD:ZM:Gw:4b:vZ:Jl:fK:xn:V7:Jk:UT:aU:sG:Xz:M6:o0:Xn:46:9M:Xk:oT:eu:Xj:CH:yB:Al:CV:8H:Gm:Ur:pD:rL:MD:q0:vY:z8:Pr:FW:ah:Bj:Sm:Sd:mp:0S:HK:X1:1L:Nq:xd:sw:lL:gm:0Y:Ia:xR:jG:0m:G4:tC:8L:OU:Gi:VK:zx:QE:yp:TC:2E:Er:II:bq:9Y:0u:m8:IQ:BI:31:6O:aS:cj:Jl:qB:wY:sU:0s:1E:o9:Nj | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	Z!1�F�2���`�$�}��rr8αu���*�x���F�li+���
��Ƹ/�:��槅�d��u�$+�4��L̶
�� �K+��~3Ԭ�B��֋�a���$k�:5��L�ȝgC�z3�VX�q����O	�1�D���W�^�l���B���.�#xG>*}n�I�H�������ܕ�㢘 ��:�
bf"y�2��V��� ����/$c������N,��`7@G`�P��&�(�W&XDMn�"��f�����\5
���`����M�z���)ƺ��J��v�> ���Վ~;�!�g����W��[���Q�D
v�g���|�gi��@ġpS�o�OD)g�j�&]��:��|�@ɀ�}�EA��S�ʁ\h߬��%��?��%�@h?{�E�2:Hxc��x
l��/�.�sp�Α7��zn.U�D�� �'y��b��-S��o��U@�����;F��pM�6���:�$�;|�}�v^��I���_0�8�2n������*n��#k ���{-�`���x\���g�C�h�v��|.����\���DQ��я�c0EU���`\����_d����N�C�@䕈I.����bN���5��fH@;���P�p�:�=$e��wMH�]HLKM��@��3��pS9!���&�J�ON3���;�?D��O{ϕ��X��Y�y`�8*-�[��I���PN`n��t��S��M�;NL+D��`��Xv�5=���ѓ�.�ۿ��D]�67����}����x���\GZ�US���R��|B��D��;�T��ݒod03w��m�֘��f1��/E�a�:���<*QB{��b�:�|ybU�d��j���E�G�s�:b�J����<�jɔ/�&����5�j�2��eϭ#�W_إGu!�G}��X9'����'��C�;��QJ�Fv����߂���T	{�L�K����~��_�[yaop|�ś�������|�YI.?��h*��/��?�(�$ш��P=�����ձÜvڪ�{�X���;�5��L?�u�<t��}}�K�7�^�QeѠ��cP�<��]M�3}v����	��$���4U��$�3%CC�jW��L��n�yd(�󝤉�A&1n��F�>�B����<!��WR���9+)�3g�$����|��2�_� �OvQ�H�yw+�@�A݆�Ad�Y�O�Uh�㕿����HQ!Q����O��&+��'vԛ��%}oϲI_�Z�Ļ˛Vb��Ļ�tqx��� ����S���6������[>�Fz�V�XXf���R����+hA"���s��e�?�}	ҏ�	�}���2;!f������Ȳym)�ž�7�O%���B2���H�o��s�E�Ժ[[��3�wq}��#޷%<:)�5-���:��A�-���-h2R�Tsv\b�� R^[y�ؤ�3�QT�1���{:��$1nA��!aW>OX¸F�&�j6�u�0�~����H�$C.�6p� 1M�Īu�^��+�b6!ZS�!�exU�@�Ô��-�µ#�lit��J��'���UW�}t��r?l��4�>�'�#
�]�Ϳ	�翩�jT��aG�.1�	՛�v�*gc��3�&��'L�G�礰�-���p۸���m�� �!��㎣4��������'��P��m(7jm��=�.����kӟ�Q�%�� [��>�m,�i�^�#ӎ���5v;;K[�ji�<��"�ar����6��:��^�#�Ae1K\�n����1���as/�(X0H�	o*�����cň�/sG�;-�G�y�:N]�����O}�v���s�n{f!\k�D�� �9�V8T���RAQ�x낓���.B(a�&2���Aj�#�W����!��>w���&�P� Q7q��H��*x_��xoi;zp�ms]�Sk8����̢���{�Q0NM�Ø��i��G��f��EKܴ^�̃tJ,�z��#�5Q	�Bb�m��U�\[��\.�������^������rL�cO~6���3�ӀE����C@S��'�wt6�m{q���쑘�����t���RLù�3�>�ZN�п%/�'�U���^)N� d��,>���?S9α��d�۾�K0�P��q�t�a�U;�u$��!�?�i�9�(KY���ˌ�8�h���R7����a�Ndly�XF��C֋a��O��x��F�G|�������0qԏ��(Ej��ޔ��w�Me��i�֭�rw�{�J&��@m��N�T���`�A�QI�����~����Ϻ���"�'E��~ �$Ц��c��|p��AvCL>�7'�:��E}[���zg�t7�gd����R�����H�E�~��r��t��6b�I1��X��[�aZ�o;hI��AGډ;�+v����zm� �E� 1s����Ll��O�����z���wQY�[R�it�d��������K:�d ��=��x�����"���a�浇T�M[{���"�%�@4�}|�j�x�R4w0�xv[Q�������q� �*��5%d�]�����~K2�s-��YP�v�k����Ĺ���{�@N���������5^����M�Q﹞.~�]rP��r�Z��n&,o����L�P�eC�<u�%C��W�?�+9S�E�%eJ�o������2R���A=]2�Bуg�m�y �����{�Mb����/��'E/T:�T/�0f�N��x��"��o�.��=��[�]�^��[D�Ԭ��i�@�%`��YE��V�OA��ѡ��l�+s.�H��d;դ	��-I��yj]���p���DQb����t ~9T+�lZ1��^%�!��/jhWA"!��e�
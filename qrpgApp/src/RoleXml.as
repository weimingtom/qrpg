package
{
	public class RoleXml
	{
		public static const data:XML = 
			<item>
				<id>12345</id>
				<speed>6</speed>
				<url>Assets/knight.png</url>
				<actions>
					<!-- 站立 -->
					<action type="stop" name="stand_0" defaultAction="true">
						<frame width="51" height="96" x="0" y="0" cx="28" cy="85" mirror="false" />
					</action>
					<action type="stop" name="stand_1" defaultAction="false">
						<frame width="47" height="94" x="50" y="0" cx="21" cy="86" mirror="false" />
					</action>
					<action type="stop" name="stand_2" defaultAction="false">
						<frame width="40" height="94" x="96" y="0" cx="18" cy="84" mirror="false" />
					</action>
					<action type="stop" name="stand_3" defaultAction="false">
						<frame width="43" height="97" x="135" y="0" cx="18" cy="86" mirror="false" />
					</action>
					<action type="stop" name="stand_4" defaultAction="false">
						<frame width="48" height="95" x="177" y="0" cx="21" cy="83" mirror="false" />
					</action>
					<action type="stop" name="stand_5" defaultAction="false">
						<frame width="43" height="97" x="135" y="0" cx="18" cy="86" mirror="true" />
					</action>
					<action type="stop" name="stand_6" defaultAction="false">
						<frame width="40" height="94" x="96" y="0" cx="18" cy="84" mirror="true" />
					</action>
					<action type="stop" name="stand_7" defaultAction="false">
						<frame width="47" height="94" x="50" y="0" cx="21" cy="86" mirror="true" />
					</action>
					
					<!-- 行走 -->
					<action type="loop" name="walk_0" defaultAction="false">
						<frame width="49" height="98" x="0" y="96" cx="25" cy="83" mirror="false" />
						<frame width="48" height="97" x="48" y="96" cx="24" cy="84" mirror="false" />
						<frame width="46" height="99" x="95" y="96" cx="23" cy="83" mirror="false" />
						<frame width="47" height="102" x="140" y="96" cx="23" cy="82" mirror="false" />
						<frame width="47" height="99" x="186" y="96" cx="23" cy="83" mirror="false" />
						<frame width="48" height="97" x="232" y="96" cx="24" cy="84" mirror="false" />
						<frame width="49" height="99" x="279" y="96" cx="25" cy="83" mirror="false" />
						<frame width="49" height="102" x="327" y="96" cx="25" cy="82" mirror="false" />
					</action>
					<action type="loop" name="walk_1" defaultAction="false">
						<frame width="44" height="93" x="376" y="96" cx="17" cy="84" mirror="false" />
						<frame width="49" height="91" x="419" y="96" cx="21" cy="85" mirror="false" />
						<frame width="54" height="89" x="467" y="96" cx="25" cy="84" mirror="false" />
						<frame width="49" height="89" x="520" y="96" cx="19" cy="83" mirror="false" />
						<frame width="44" height="89" x="568" y="96" cx="17" cy="84" mirror="false" />
						<frame width="43" height="89" x="611" y="96" cx="18" cy="85" mirror="false" />
						<frame width="43" height="91" x="653" y="96" cx="19" cy="84" mirror="false" />
						<frame width="44" height="92" x="377" y="293" cx="18" cy="83" mirror="false" />
					</action>
					<action type="loop" name="walk_2" defaultAction="false">
						<frame width="37" height="93" x="0" y="197" cx="13" cy="83" mirror="false" />
						<frame width="43" height="92" x="36" y="197" cx="15" cy="84" mirror="false" />
						<frame width="53" height="90" x="78" y="197" cx="23" cy="83" mirror="false" />
						<frame width="47" height="89" x="130" y="197" cx="17" cy="82" mirror="false" />
						<frame width="41" height="91" x="176" y="197" cx="13" cy="83" mirror="false" />
						<frame width="42" height="90" x="216" y="197" cx="16" cy="84" mirror="false" />
						<frame width="50" height="89" x="257" y="197" cx="25" cy="83" mirror="false" />
						<frame width="43" height="91" x="306" y="197" cx="18" cy="82" mirror="false" />
					</action>
					<action type="loop" name="walk_3" defaultAction="false">
						<frame width="41" height="97" x="349" y="197" cx="17" cy="83" mirror="false" />
						<frame width="45" height="96" x="389" y="197" cx="21" cy="84" mirror="false" />
						<frame width="46" height="95" x="433" y="197" cx="23" cy="83" mirror="false" />
						<frame width="44" height="97" x="478" y="197" cx="21" cy="82" mirror="false" />
						<frame width="40" height="98" x="521" y="197" cx="17" cy="83" mirror="false" />
						<frame width="46" height="96" x="560" y="197" cx="21" cy="84" mirror="false" />
						<frame width="48" height="94" x="605" y="197" cx="22" cy="83" mirror="false" />
						<frame width="43" height="96" x="652" y="197" cx="19" cy="82" mirror="false" />
					</action>
					<action type="loop" name="walk_4" defaultAction="false">
						<frame width="48" height="95" x="0" y="293" cx="21" cy="83" mirror="false" />
						<frame width="48" height="94" x="47" y="293" cx="21" cy="84" mirror="false" />
						<frame width="48" height="94" x="94" y="293" cx="21" cy="83" mirror="false" />
						<frame width="48" height="93" x="141" y="293" cx="21" cy="82" mirror="false" />
						<frame width="48" height="95" x="188" y="293" cx="21" cy="83" mirror="false" />
						<frame width="48" height="95" x="235" y="293" cx="21" cy="84" mirror="false" />
						<frame width="48" height="95" x="282" y="293" cx="21" cy="83" mirror="false" />
						<frame width="48" height="95" x="329" y="293" cx="21" cy="82" mirror="false" />
					</action>
					<action type="loop" name="walk_5" defaultAction="false">
						<frame width="41" height="97" x="349" y="197" cx="17" cy="83" mirror="true" />
						<frame width="45" height="96" x="389" y="197" cx="21" cy="84" mirror="true" />
						<frame width="46" height="95" x="433" y="197" cx="23" cy="83" mirror="true" />
						<frame width="44" height="97" x="478" y="197" cx="21" cy="82" mirror="true" />
						<frame width="40" height="98" x="521" y="197" cx="17" cy="83" mirror="true" />
						<frame width="46" height="96" x="560" y="197" cx="21" cy="84" mirror="true" />
						<frame width="48" height="94" x="605" y="197" cx="22" cy="83" mirror="true" />
						<frame width="43" height="96" x="652" y="197" cx="19" cy="82" mirror="true" />
					</action>
					<action type="loop" name="walk_6" defaultAction="false">
						<frame width="37" height="93" x="0" y="197" cx="13" cy="83" mirror="true" />
						<frame width="43" height="92" x="36" y="197" cx="15" cy="84" mirror="true" />
						<frame width="53" height="90" x="78" y="197" cx="23" cy="83" mirror="true" />
						<frame width="47" height="89" x="130" y="197" cx="17" cy="82" mirror="true" />
						<frame width="41" height="91" x="176" y="197" cx="13" cy="83" mirror="true" />
						<frame width="42" height="90" x="216" y="197" cx="16" cy="84" mirror="true" />
						<frame width="50" height="89" x="257" y="197" cx="25" cy="83" mirror="true" />
						<frame width="43" height="91" x="306" y="197" cx="18" cy="82" mirror="true" />
					</action>
					<action type="loop" name="walk_7" defaultAction="false">
						<frame width="44" height="93" x="376" y="96" cx="17" cy="84" mirror="true" />
						<frame width="49" height="91" x="419" y="96" cx="21" cy="85" mirror="true" />
						<frame width="54" height="89" x="467" y="96" cx="25" cy="84" mirror="true" />
						<frame width="49" height="89" x="520" y="96" cx="19" cy="83" mirror="true" />
						<frame width="44" height="89" x="568" y="96" cx="17" cy="84" mirror="true" />
						<frame width="43" height="89" x="611" y="96" cx="18" cy="85" mirror="true" />
						<frame width="43" height="91" x="653" y="96" cx="19" cy="84" mirror="true" />
						<frame width="44" height="92" x="377" y="293" cx="18" cy="83" mirror="true" />
					</action>
					
					<!-- 坐下 -->
					<action type="stop" name="sit_0" defaultAction="false">
						<frame width="55" height="79" x="0" y="387" cx="24" cy="60" mirror="false" />
					</action>
					<action type="stop" name="sit_1" defaultAction="false">
						<frame width="64" height="75" x="54" y="387" cx="29" cy="60" mirror="false" />
					</action>
					<action type="stop" name="sit_2" defaultAction="false">
						<frame width="64" height="74" x="117" y="387" cx="25" cy="63" mirror="false" />
					</action>
					<action type="stop" name="sit_3" defaultAction="false">
						<frame width="57" height="80" x="180" y="387" cx="24" cy="59" mirror="false" />
					</action>
					<action type="stop" name="sit_4" defaultAction="false">
						<frame width="50" height="79" x="236" y="387" cx="22" cy="60" mirror="false" />
					</action>
					<action type="stop" name="sit_5" defaultAction="false">
						<frame width="57" height="80" x="180" y="387" cx="24" cy="59" mirror="true" />
					</action>
					<action type="stop" name="sit_6" defaultAction="false">
						<frame width="64" height="74" x="117" y="387" cx="25" cy="63" mirror="true" />
					</action>
					<action type="stop" name="sit_7" defaultAction="false">
						<frame width="64" height="75" x="54" y="387" cx="29" cy="60" mirror="true" />
					</action>
					
					<!-- 捡东西 -->
					<action type="playLast" name="pick_0" defaultAction="false">
						<frame width="51" height="76" x="286" y="387" cx="19" cy="67" mirror="false" />
						<frame width="57" height="56" x="336" y="387" cx="25" cy="47" mirror="false" />
						<frame width="51" height="76" x="286" y="387" cx="19" cy="67" mirror="false" />
					</action>
					<action type="playLast" name="pick_1" defaultAction="false">
						<frame width="53" height="72" x="392" y="387" cx="28" cy="63" mirror="false" />
						<frame width="54" height="60" x="444" y="387" cx="28" cy="51" mirror="false" />
						<frame width="53" height="72" x="392" y="387" cx="28" cy="63" mirror="false" />
					</action>
					<action type="playLast" name="pick_2" defaultAction="false">
						<frame width="53" height="72" x="392" y="387" cx="28" cy="63" mirror="true" />
						<frame width="54" height="60" x="444" y="387" cx="28" cy="51" mirror="true" />
						<frame width="53" height="72" x="392" y="387" cx="28" cy="63" mirror="true" />
					</action>
					<action type="playLast" name="pick_3" defaultAction="false">
						<frame width="51" height="76" x="286" y="387" cx="19" cy="67" mirror="true" />
						<frame width="57" height="56" x="336" y="387" cx="25" cy="47" mirror="true" />
						<frame width="51" height="76" x="286" y="387" cx="19" cy="67" mirror="true" />
					</action>
					
					<!-- 受攻击 -->
					<action type="playLast" name="attacked_0" defaultAction="false">
						<frame width="49" height="89" x="495" y="0" cx="14" cy="80" mirror="false" />
						<frame width="54" height="88" x="543" y="0" cx="13" cy="80" mirror="false" />
						<frame width="66" height="89" x="596" y="0" cx="20" cy="80" mirror="false" />
						<frame width="54" height="88" x="543" y="0" cx="13" cy="80" mirror="false" />
						<frame width="49" height="89" x="495" y="0" cx="14" cy="80" mirror="false" />
					</action>
					<action type="playLast" name="attacked_1" defaultAction="false">
						<frame width="46" height="88" x="507" y="654" cx="21" cy="76" mirror="false" />
						<frame width="48" height="85" x="552" y="654" cx="21" cy="74" mirror="false" />
						<frame width="51" height="79" x="599" y="654" cx="16" cy="63" mirror="false" />
						<frame width="48" height="85" x="552" y="654" cx="21" cy="74" mirror="false" />
						<frame width="46" height="88" x="507" y="654" cx="21" cy="76" mirror="false" />
					</action>
					<action type="playLast" name="attacked_2" defaultAction="false">
						<frame width="46" height="88" x="507" y="654" cx="21" cy="76" mirror="true" />
						<frame width="48" height="85" x="552" y="654" cx="21" cy="74" mirror="true" />
						<frame width="51" height="79" x="599" y="654" cx="16" cy="63" mirror="true" />
						<frame width="48" height="85" x="552" y="654" cx="21" cy="74" mirror="true" />
						<frame width="46" height="88" x="507" y="654" cx="21" cy="76" mirror="true" />
					</action>
					<action type="playLast" name="attacked_3" defaultAction="false">
						<frame width="49" height="89" x="495" y="0" cx="14" cy="80" mirror="true" />
						<frame width="54" height="88" x="543" y="0" cx="13" cy="80" mirror="true" />
						<frame width="66" height="89" x="596" y="0" cx="20" cy="80" mirror="true" />
						<frame width="54" height="88" x="543" y="0" cx="13" cy="80" mirror="true" />
						<frame width="49" height="89" x="495" y="0" cx="14" cy="80" mirror="true" />
					</action>
					
					<!-- 死掉 -->
					<action type="stopAtEnd" name="death_0" defaultAction="false">
						<frame width="49" height="89" x="495" y="0" cx="14" cy="80" mirror="false" />
						<frame width="54" height="88" x="543" y="0" cx="13" cy="80" mirror="false" />
						<frame width="66" height="89" x="596" y="0" cx="20" cy="80" mirror="false" />
						<frame width="66" height="69" x="661" y="0" cx="4" cy="64" mirror="false" />
					</action>
					<action type="stopAtEnd" name="death_1" defaultAction="false">
						<frame width="46" height="88" x="507" y="654" cx="21" cy="76" mirror="false" />
						<frame width="48" height="85" x="552" y="654" cx="21" cy="74" mirror="false" />
						<frame width="51" height="79" x="599" y="654" cx="16" cy="63" mirror="false" />
						<frame width="84" height="53" x="483" y="601" cx="0" cy="0" mirror="false" />
					</action>
					<action type="stopAtEnd" name="death_2" defaultAction="false">
						<frame width="46" height="88" x="507" y="654" cx="21" cy="76" mirror="true" />
						<frame width="48" height="85" x="552" y="654" cx="21" cy="74" mirror="true" />
						<frame width="51" height="79" x="599" y="654" cx="16" cy="63" mirror="true" />
						<frame width="84" height="53" x="483" y="601" cx="0" cy="0" mirror="true" />
					</action>
					<action type="stopAtEnd" name="death_3" defaultAction="false">
						<frame width="49" height="89" x="495" y="0" cx="14" cy="80" mirror="true" />
						<frame width="54" height="88" x="543" y="0" cx="13" cy="80" mirror="true" />
						<frame width="66" height="89" x="596" y="0" cx="20" cy="80" mirror="true" />
						<frame width="66" height="69" x="661" y="0" cx="4" cy="64" mirror="true" />
					</action>
					
					<!-- 拿剑战斗状态 -->
					<action type="loop" name="fight_sword_0" defaultAction="false">
						<frame width="87" height="94" x="0" y="466" cx="58" cy="84" mirror="false" />
						<frame width="87" height="94" x="86" y="466" cx="58" cy="84" mirror="false" />
						<frame width="85" height="95" x="172" y="466" cx="56" cy="85" mirror="false" />
						<frame width="85" height="96" x="256" y="466" cx="57" cy="86" mirror="false" />
						<frame width="86" height="95" x="340" y="466" cx="57" cy="85" mirror="false" />
						<frame width="87" height="94" x="425" y="466" cx="58" cy="84" mirror="false" />
					</action>
					<action type="loop" name="fight_sword_1" defaultAction="false">
						<frame width="45" height="94" x="225" y="0" cx="19" cy="79" mirror="false" />
						<frame width="44" height="94" x="269" y="0" cx="19" cy="80" mirror="false" />
						<frame width="46" height="95" x="312" y="0" cx="21" cy="81" mirror="false" />
						<frame width="47" height="95" x="357" y="0" cx="23" cy="82" mirror="false" />
						<frame width="47" height="95" x="403" y="0" cx="22" cy="81" mirror="false" />
						<frame width="46" height="93" x="449" y="0" cx="21" cy="79" mirror="false" />
					</action>
					<action type="loop" name="fight_sword_2" defaultAction="false">
						<frame width="45" height="94" x="225" y="0" cx="19" cy="79" mirror="true" />
						<frame width="44" height="94" x="269" y="0" cx="19" cy="80" mirror="true" />
						<frame width="46" height="95" x="312" y="0" cx="21" cy="81" mirror="true" />
						<frame width="47" height="95" x="357" y="0" cx="23" cy="82" mirror="true" />
						<frame width="47" height="95" x="403" y="0" cx="22" cy="81" mirror="true" />
						<frame width="46" height="93" x="449" y="0" cx="21" cy="79" mirror="true" />
					</action>
					<action type="loop" name="fight_sword_3" defaultAction="false">
						<frame width="87" height="94" x="0" y="466" cx="58" cy="84" mirror="true" />
						<frame width="87" height="94" x="86" y="466" cx="58" cy="84" mirror="true" />
						<frame width="85" height="95" x="172" y="466" cx="56" cy="85" mirror="true" />
						<frame width="85" height="96" x="256" y="466" cx="57" cy="86" mirror="true" />
						<frame width="86" height="95" x="340" y="466" cx="57" cy="85" mirror="true" />
						<frame width="87" height="94" x="425" y="466" cx="58" cy="84" mirror="true" />
					</action>
					
					<!-- 剑攻击A -->
					<action type="playLast" name="attack_swordA_0" defaultAction="false">
						<frame width="87" height="94" x="0" y="466" cx="58" cy="84" mirror="false" />
						<frame width="54" height="94" x="0" y="561" cx="29" cy="84" mirror="false" />
						<frame width="57" height="93" x="53" y="561" cx="35" cy="83" mirror="false" />
						<frame width="56" height="93" x="109" y="561" cx="36" cy="83" mirror="false" />
						<frame width="56" height="93" x="109" y="561" cx="36" cy="83" mirror="false" />
						<frame width="81" height="89" x="164" y="561" cx="47" cy="68" mirror="false" />
						<frame width="82" height="87" x="244" y="561" cx="48" cy="66" mirror="false" />
						<frame width="79" height="85" x="325" y="561" cx="48" cy="64" mirror="false" />
						<frame width="80" height="85" x="403" y="561" cx="48" cy="64" mirror="false" />
					</action>
					<action type="playLast" name="attack_swordA_1" defaultAction="false">
						<frame width="45" height="94" x="225" y="0" cx="19" cy="79" mirror="false" />
						<frame width="43" height="95" x="0" y="654" cx="22" cy="82" mirror="false" />
						<frame width="78" height="95" x="42" y="654" cx="60" cy="82" mirror="false" />
						<frame width="77" height="94" x="119" y="654" cx="63" cy="82" mirror="false" />
						<frame width="77" height="94" x="119" y="654" cx="63" cy="82" mirror="false" />
						<frame width="77" height="93" x="195" y="654" cx="43" cy="84" mirror="false" />
						<frame width="78" height="96" x="271" y="654" cx="44" cy="87" mirror="false" />
						<frame width="80" height="97" x="348" y="654" cx="43" cy="88" mirror="false" />
						<frame width="80" height="97" x="427" y="654" cx="43" cy="88" mirror="false" />
					</action>
					<action type="playLast" name="attack_swordA_2" defaultAction="false">
						<frame width="45" height="94" x="225" y="0" cx="19" cy="79" mirror="true" />
						<frame width="43" height="95" x="0" y="654" cx="22" cy="82" mirror="true" />
						<frame width="78" height="95" x="42" y="654" cx="60" cy="82" mirror="true" />
						<frame width="77" height="94" x="119" y="654" cx="63" cy="82" mirror="true" />
						<frame width="77" height="94" x="119" y="654" cx="63" cy="82" mirror="true" />
						<frame width="77" height="93" x="195" y="654" cx="43" cy="84" mirror="true" />
						<frame width="78" height="96" x="271" y="654" cx="44" cy="87" mirror="true" />
						<frame width="80" height="97" x="348" y="654" cx="43" cy="88" mirror="true" />
						<frame width="80" height="97" x="427" y="654" cx="43" cy="88" mirror="true" />
					</action>
					<action type="playLast" name="attack_swordA_3" defaultAction="false">
						<frame width="87" height="94" x="0" y="466" cx="58" cy="84" mirror="true" />
						<frame width="54" height="94" x="0" y="561" cx="29" cy="84" mirror="true" />
						<frame width="57" height="93" x="53" y="561" cx="35" cy="83" mirror="true" />
						<frame width="56" height="93" x="109" y="561" cx="36" cy="83" mirror="true" />
						<frame width="56" height="93" x="109" y="561" cx="36" cy="83" mirror="true" />
						<frame width="81" height="89" x="164" y="561" cx="47" cy="68" mirror="true" />
						<frame width="82" height="87" x="244" y="561" cx="48" cy="66" mirror="true" />
						<frame width="79" height="85" x="325" y="561" cx="48" cy="64" mirror="true" />
						<frame width="80" height="85" x="403" y="561" cx="48" cy="64" mirror="true" />
					</action>
					
					<!-- 剑攻击B -->
					<action type="playLast" name="attack_swordB_0" defaultAction="false">
						<frame width="57" height="96" x="513" y="382" cx="32" cy="82" mirror="false" />
						<frame width="54" height="94" x="0" y="561" cx="29" cy="84" mirror="false" />
						<frame width="56" height="93" x="109" y="561" cx="36" cy="83" mirror="false" />
						<frame width="159" height="108" x="569" y="401" cx="107" cy="68" mirror="false" />
						<frame width="139" height="108" x="589" y="294" cx="105" cy="66" mirror="false" />
						<frame width="139" height="89" x="451" y="294" cx="107" cy="64" mirror="false" />
					</action>
					<action type="playLast" name="attack_swordB_1" defaultAction="false">
						<frame width="57" height="97" x="512" y="478" cx="34" cy="82" mirror="false" />
						<frame width="43" height="95" x="0" y="654" cx="22" cy="82" mirror="false" />
						<frame width="78" height="95" x="42" y="654" cx="60" cy="82" mirror="false" />
						<frame width="77" height="94" x="119" y="654" cx="63" cy="82" mirror="false" />
						<frame width="160" height="127" x="568" y="509" cx="107" cy="118" mirror="false" />
						<frame width="78" height="96" x="271" y="654" cx="44" cy="87" mirror="false" />
						<frame width="80" height="97" x="348" y="654" cx="43" cy="88" mirror="false" />
						<frame width="80" height="97" x="427" y="654" cx="43" cy="88" mirror="false" />
					</action>
					<action type="playLast" name="attack_swordB_2" defaultAction="false">
						<frame width="57" height="97" x="512" y="478" cx="34" cy="82" mirror="true" />
						<frame width="43" height="95" x="0" y="654" cx="22" cy="82" mirror="true" />
						<frame width="78" height="95" x="42" y="654" cx="60" cy="82" mirror="true" />
						<frame width="77" height="94" x="119" y="654" cx="63" cy="82" mirror="true" />
						<frame width="160" height="127" x="568" y="509" cx="107" cy="118" mirror="true" />
						<frame width="78" height="96" x="271" y="654" cx="44" cy="87" mirror="true" />
						<frame width="80" height="97" x="348" y="654" cx="43" cy="88" mirror="true" />
						<frame width="80" height="97" x="427" y="654" cx="43" cy="88" mirror="true" />
					</action>
					<action type="playLast" name="attack_swordB_3" defaultAction="false">
						<frame width="57" height="96" x="513" y="382" cx="32" cy="82" mirror="true" />
						<frame width="54" height="94" x="0" y="561" cx="29" cy="84" mirror="true" />
						<frame width="56" height="93" x="109" y="561" cx="36" cy="83" mirror="true" />
						<frame width="159" height="108" x="569" y="401" cx="107" cy="68" mirror="true" />
						<frame width="139" height="108" x="589" y="294" cx="105" cy="66" mirror="true" />
						<frame width="139" height="89" x="451" y="294" cx="107" cy="64" mirror="true" />
					</action>
					
					<!-- 拿矛战斗状态 -->
					<action type="loop" name="fight_lance_0" defaultAction="false">
						<frame width="106" height="94" x="0" y="750" cx="57" cy="84" mirror="false" />
						<frame width="106" height="94" x="105" y="750" cx="57" cy="84" mirror="false" />
						<frame width="106" height="95" x="210" y="750" cx="54" cy="85" mirror="false" />
						<frame width="106" height="96" x="315" y="750" cx="52" cy="86" mirror="false" />
						<frame width="106" height="95" x="420" y="750" cx="53" cy="85" mirror="false" />
						<frame width="106" height="94" x="525" y="750" cx="54" cy="84" mirror="false" />
					</action>
					<action type="loop" name="fight_lance_1" defaultAction="false">
						<frame width="113" height="94" x="0" y="845" cx="87" cy="79" mirror="false" />
						<frame width="113" height="94" x="112" y="845" cx="88" cy="80" mirror="false" />
						<frame width="114" height="95" x="224" y="845" cx="89" cy="81" mirror="false" />
						<frame width="115" height="95" x="337" y="845" cx="91" cy="82" mirror="false" />
						<frame width="115" height="95" x="451" y="845" cx="90" cy="81" mirror="false" />
						<frame width="114" height="93" x="565" y="845" cx="89" cy="79" mirror="false" />
					</action>
					<action type="loop" name="fight_lance_2" defaultAction="false">
						<frame width="113" height="94" x="0" y="845" cx="87" cy="79" mirror="true" />
						<frame width="113" height="94" x="112" y="845" cx="88" cy="80" mirror="true" />
						<frame width="114" height="95" x="224" y="845" cx="89" cy="81" mirror="true" />
						<frame width="115" height="95" x="337" y="845" cx="91" cy="82" mirror="true" />
						<frame width="115" height="95" x="451" y="845" cx="90" cy="81" mirror="true" />
						<frame width="114" height="93" x="565" y="845" cx="89" cy="79" mirror="true" />
					</action>
					<action type="loop" name="fight_lance_3" defaultAction="false">
						<frame width="106" height="94" x="0" y="750" cx="57" cy="84" mirror="true" />
						<frame width="106" height="94" x="105" y="750" cx="57" cy="84" mirror="true" />
						<frame width="106" height="95" x="210" y="750" cx="54" cy="85" mirror="true" />
						<frame width="106" height="96" x="315" y="750" cx="52" cy="86" mirror="true" />
						<frame width="106" height="95" x="420" y="750" cx="53" cy="85" mirror="true" />
						<frame width="106" height="94" x="525" y="750" cx="54" cy="84" mirror="true" />
					</action>
					
					<!-- 矛攻击 -->
					<action type="playLast" name="attack_lance_0" defaultAction="false">
						<frame width="106" height="94" x="0" y="750" cx="57" cy="84" mirror="false" />
						<frame width="67" height="105" x="0" y="939" cx="38" cy="95" mirror="false" />
						<frame width="67" height="104" x="66" y="939" cx="41" cy="94" mirror="false" />
						<frame width="67" height="105" x="132" y="939" cx="40" cy="95" mirror="false" />
						<frame width="116" height="91" x="198" y="939" cx="90" cy="72" mirror="false" />
						<frame width="144" height="92" x="313" y="939" cx="118" cy="70" mirror="false" />
						<frame width="143" height="91" x="456" y="939" cx="120" cy="69" mirror="false" />
						<frame width="117" height="91" x="598" y="939" cx="100" cy="72" mirror="false" />
					</action>
					<action type="playLast" name="attack_lance_1" defaultAction="false">
						<frame width="113" height="94" x="0" y="845" cx="87" cy="79" mirror="false" />
						<frame width="71" height="110" x="547" y="1031" cx="49" cy="95" mirror="false" />
						<frame width="67" height="112" x="617" y="1029" cx="51" cy="97" mirror="false" />
						<frame width="72" height="110" x="631" y="736" cx="58" cy="95" mirror="false" />
						<frame width="130" height="93" x="0" y="1048" cx="110" cy="84" mirror="false" />
						<frame width="150" height="102" x="248" y="1039" cx="132" cy="93" mirror="false" />
						<frame width="151" height="104" x="397" y="1037" cx="135" cy="95" mirror="false" />
						<frame width="120" height="93" x="129" y="1048" cx="111" cy="84" mirror="false" />
					</action>
					<action type="playLast" name="attack_lance_2" defaultAction="false">
						<frame width="113" height="94" x="0" y="845" cx="87" cy="79" mirror="true" />
						<frame width="71" height="110" x="547" y="1031" cx="49" cy="95" mirror="true" />
						<frame width="67" height="112" x="617" y="1029" cx="51" cy="97" mirror="true" />
						<frame width="72" height="110" x="631" y="736" cx="58" cy="95" mirror="true" />
						<frame width="130" height="93" x="0" y="1048" cx="110" cy="84" mirror="true" />
						<frame width="150" height="102" x="248" y="1039" cx="132" cy="93" mirror="true" />
						<frame width="151" height="104" x="397" y="1037" cx="135" cy="95" mirror="true" />
						<frame width="120" height="93" x="129" y="1048" cx="111" cy="84" mirror="true" />
					</action>
					<action type="playLast" name="attack_lance_3" defaultAction="false">
						<frame width="106" height="94" x="0" y="750" cx="57" cy="84" mirror="true" />
						<frame width="67" height="105" x="0" y="939" cx="38" cy="95" mirror="true" />
						<frame width="67" height="104" x="66" y="939" cx="41" cy="94" mirror="true" />
						<frame width="67" height="105" x="132" y="939" cx="40" cy="95" mirror="true" />
						<frame width="116" height="91" x="198" y="939" cx="90" cy="72" mirror="true" />
						<frame width="144" height="92" x="313" y="939" cx="118" cy="70" mirror="true" />
						<frame width="143" height="91" x="456" y="939" cx="120" cy="69" mirror="true" />
						<frame width="117" height="91" x="598" y="939" cx="100" cy="72" mirror="true" />
					</action>
				</actions>
			</item>
	}
}
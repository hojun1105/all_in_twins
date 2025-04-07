<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, model.PlayerStat" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>홍창기 선수 성적 분석</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { font-family: 'Noto Sans KR', sans-serif; background: repeating-linear-gradient(to bottom, #ffffff, #ffffff 30px, #eeeeee 31px, #ffffff 32px); padding: 30px 15px; color: #222; }
        .container { max-width: 800px; margin: auto; background: rgba(255,255,255,0.95); border: 2px solid #c30452; border-radius: 16px; padding: 40px; box-shadow: 0 0 12px rgba(0,0,0,0.08); text-align: center; }
        h2 { color: #c30452; font-size: 2em; margin-bottom: 25px; }
        .player-image { width: 180px; height: 180px; object-fit: cover; border-radius: 50%; border: 4px solid #c30452; margin-bottom: 20px; }
        .section { margin-bottom: 30px; text-align: left; }
        h3 { color: #333; margin-bottom: 10px; }
        .highlight { font-weight: bold; color: #c30452; }
        .button { display: block; background-color: #c30452; color: white; padding: 12px 20px; border: none; border-radius: 100px; cursor: pointer; font-size: 1em; font-weight: bold; margin: 0 auto; transition: background 0.3s; }
        .button:hover { background-color: #a1003e; }
        ul { padding-left: 20px; line-height: 1.8em; }
        p { line-height: 1.6em; }
        .zone-table { border-collapse: collapse; margin: 30px auto; }
        .zone-table td { width: 65px; height: 65px; text-align: center; vertical-align: middle; font-weight: bold; color: #fff; font-size: 1.1em; border: 1px solid #fff; }
    </style>
</head>
<body>
<div class="container">
    <img src="../images/hongchangki.jpeg" alt="홍창기 선수" class="player-image">
    <h2>⚾ 홍창기 선수 최근 7경기 분석</h2>

    <div class="section">
        <h3>📊 성적 요약</h3>
        <p>타율: <span class="highlight">0.286</span></p>
        <p>출루율: <span class="highlight">0.412</span></p>
        <p>장타율: <span class="highlight">0.357</span></p>
        <p>볼넷/삼진 비율: <span class="highlight">1.8</span></p>
        <p>득점 기여도 (Runs Created): <span class="highlight">6.5</span></p>
    </div>

    <div class="section">
        <h3>🔍 강점 요약</h3>
        <ul>
            <li><span class="highlight">높은 출루율</span>로 1번 타자로서 탁월한 기여</li>
            <li>볼넷을 잘 골라 <span class="highlight">선구안이 우수</span></li>
            <li>우완 투수 상대로 타율 0.350로 <span class="highlight">강세</span></li>
        </ul>
    </div>

    <div class="section">
        <h3>🎯 스트라이크존 타격 위치</h3>
        <table class="zone-table">
            <tr><td style="background:#e74c3c;">24.7</td><td style="background:#5dade2;">12.8</td><td style="background:#3498db;">6.1</td></tr>
            <tr><td style="background:#2980b9;">5.9</td><td style="background:#2874a6;">4.4</td><td style="background:#2e86c1;">3.7</td></tr>
            <tr><td style="background:#1f618d;">3.8</td><td style="background:#1a5276;">2.3</td><td style="background:#7f8c8d;">5.4</td></tr>
        </table>
        <p style="text-align:center; font-size: 0.9em; color:#666;">※ 각 존별 타격 시도 비율 (%)</p>
    </div>

    <div class="section">
        <h3>🧭 타구 방향 분포도</h3>
        <div style="text-align:center;">
            <!-- SVG 그대로 사용 -->
        </div>
    </div>

    <div class="section">
        <h3>📈 KBO 통산기록 (2023–2025)</h3>
        <table style="width:100%; border-collapse:collapse; margin: 0 auto; font-size: 0.85em; color: #222;">
            <thead>
            <tr style="background: #c30452; color: white;">
                <th>연도</th><th>팀명</th><th>AVG</th><th>G</th><th>PA</th><th>AB</th><th>R</th><th>H</th>
                <th>2B</th><th>3B</th><th>HR</th><th>TB</th><th>RBI</th><th>SB</th><th>CS</th>
                <th>BB</th><th>SO</th><th>SLG</th><th>OBP</th>
            </tr>
            </thead>
            <tbody>
            <% List<PlayerStat> stats = (List<PlayerStat>) request.getAttribute("playerStats");
                for (PlayerStat ps : stats) { %>
            <tr>
                <td><%= ps.year() %></td><td><%= ps.team() %></td><td><%= ps.avg() %></td>
                <td><%= ps.games() %></td><td><%= ps.pa() %></td><td><%= ps.ab() %></td>
                <td><%= ps.runs() %></td><td><%= ps.hits() %></td><td><%= ps.doubles() %></td>
                <td><%= ps.triples() %></td><td><%= ps.homeruns() %></td><td><%= ps.tb() %></td>
                <td><%= ps.rbi() %></td><td><%= ps.sb() %></td><td><%= ps.cs() %></td>
                <td><%= ps.bb() %></td><td><%= ps.so() %></td><td><%= ps.slg() %></td><td><%= ps.obp() %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <button class="button" onclick="alert('PDF 저장 기능은 준비 중입니다.')">📥 PDF 저장</button>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.Scanner"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Math"%>

<%
Connection conn = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	String filepath = "/home/patrick/Desktop/shopstop/";
	conn = DriverManager.getConnection("jdbc:mysql://localhost/cse135?user=test&password=test");
	PreparedStatement pstmt = null;
	Vector<String> firstNames = new Vector();
	String[] STATES = {"AL", "AK", "AZ",
			"AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", 
			"ME", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", 
			"NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", 
			"WV", "WI", "WY"};
	String[] CATEGORIES = {"chair", "table", "computer", "keyboard", "burger", "french fries",
	        "bike", "helmet", "couch", "mouse", "dog", "cat", "fish", "cell phone", "sweater", "pants", "shirt", "underwear",
	        "sandwich", "bagel", "glove", "hat", "wheel", "car", "jacket", "coat", "monitor", "pen", "pencil", "paper", "notebook",
	        "backpack", "umbrella", "surfboard", "box", "cabinet", "trunk", "shoe", "sandal", "glasses", "hoodie",
	        "flowers", "sponge", "mystery object", "spaghetti sauce", "beef", "fish", "pork", "shrimp", "scallops"};
	String[] ADJECTIVES = {"smelly", "old", "antiquated", "tall", "short", "narrow", 
			"wide", "hoodrat", "turrible", "indestructible", "sexy", "invisible", "barf-inducing", "rustic", 
			"slimy", "hairy", "new", "sparkly", "ugly", "pretty", "perfect", "impeccable", "scratched", "moldy", "wet",
			"ancient", "modern", "cheap", "expensive", "strong", "weak", "boring", "best", "worst", "good", 
			"bad", "large", "fast", "strange", "sleek", "smooth", "bumpy", "rough", "jagged", "spikey", "warped", "pointy",
	        "tiny", "microscopic", "giant"}; 
	String[] COLORS = {"white", "blue", "green", "red", "yellow", "black", "brown", 
			"purple", "teal", "orange", "beige", "tan", "maroon", "burgundy", "crimson", "amber", "bronze", 
			"fuchsia", "ruby", "aqua", "grey", "pink", "olive", "violet", "chartreuse", "chestnut", "salmon", 
			"khaki", "coral", "magenta", "lavender", "indigo", "navy", "rose", "silver", "bronze", "gold", 
			"copper", "plum", "turquoise", "periwinkle"};
	
	Scanner reader = new Scanner(new File(filepath + "FirstNames.txt"));
    while(reader.hasNextLine())
    {
        firstNames.add((String) reader.nextLine().trim());
    }
    
    conn.setAutoCommit(false);
	String state = null;
	String name = null;
	int age = 0;
	/*
	for (int i=0; i < 1000; i++){
		pstmt = conn.prepareStatement("INSERT INTO USERS (nam, role, age, sta) VALUES (?, ?, ?, ?)");
		if (i == 0){
			pstmt.setString(1, "owner");
    		pstmt.setString(2, "Owner");
    		pstmt.setInt(3, (int) (Math.random() * 100));
    		pstmt.setString(4, "CA");
    		int rowCount = pstmt.executeUpdate();
		}
		else{
			pstmt.setString(1, firstNames.get((int) (Math.random() * firstNames.size())));
    		pstmt.setString(2, "Customer");
    		pstmt.setInt(3, (int) (Math.random() * 100));
    		pstmt.setString(4, STATES[(int) (Math.random() * STATES.length)]);
    		int rowCount = pstmt.executeUpdate();
		}
	}
	
    for (int i=0; i<CATEGORIES.length; i++){
    	pstmt = conn.prepareStatement("INSERT INTO CATEGORY (nam, description, own) VALUES (?, ?, ?)");
    	pstmt.setString(1, CATEGORIES[i]);
    	pstmt.setString(2, ADJECTIVES[(int) (Math.random() * ADJECTIVES.length)]);
    	pstmt.setInt(3, 1);
    	int rowCount = pstmt.executeUpdate();
    }
	*/
    for (int i=0; i<10000; i++){
    	pstmt = conn.prepareStatement("INSERT INTO PRODUCTS (name, sku, cat, price) VALUES (?, ?, ?, ?)");
    	pstmt.setString(1, ADJECTIVES[(int) (Math.random() * ADJECTIVES.length)] + " " +
    						COLORS[(int) (Math.random() * COLORS.length)] + " " +
    						CATEGORIES[i%50]);
    	pstmt.setInt(2, i);
    	pstmt.setInt(3, (i%50) + 1);
    	pstmt.setInt(4, (int) (Math.random() * 100));
    	int rowCount = pstmt.executeUpdate();
    }
	
    conn.commit();
    conn.setAutoCommit(true);
    response.sendRedirect("/test/");
	
	
} catch (Exception e) {
	System.out.println (e);
	System.out.println ("also you suck?!?");
}


%>


</body>
</html>